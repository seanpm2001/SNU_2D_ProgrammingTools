#using scripts\shared\array_shared;
#using scripts\shared\callbacks_shared;
#using scripts\shared\hud_util_shared;
#using scripts\shared\system_shared;
#using scripts\shared\util_shared;

#insert scripts\shared\shared.gsh;

#using scripts\shared\weapons\_weaponobjects;

#using scripts\zm\_zm_utility;

#define	POI_MAX_RADIUS				200
#define	POI_HALF_HEIGHT				200
#define	POI_INNER_SPACING			2
#define	POI_RADIUS_FROM_EDGES		32
#define POI_HEIGHT 					200

#define SPIKE_POI_RANK				800
#define SPIKE_CHARGE_TIME			15

#precache("string", "PRESS ^3[{+melee}]^7 TO DETONATE SPIKE CHARGE");

#namespace zm_weap_spike_launcher;

function autoexec __init__system__(){
	_arr = undefined;
	system::register("zm_weap_spike_launcher", &__init__, &__main__, _arr);
}

function __init__(){
}

function __main__(){
	callback::on_connect(&spikeLauncherTutorialWatcher);
	callback::on_connect(&spikeLauncherWatcher);
	callback::on_connect(&spikeUpgradeWatcher);

	DEFAULT(level.monkey_attract_dist, 1536);
	DEFAULT(level.num_monkey_attractors, 96);
	DEFAULT(level.monkey_attract_dist_diff, 45);
	DEFAULT(level.spike_attract_dist, level.monkey_attract_dist);
	DEFAULT(level.num_spike_attractors, level.num_monkey_attractors);
	DEFAULT(level.spike_attract_dist_diff, level.monkey_attract_dist_diff);
}

function setSpikeAttractDist(dist){
	if(isdefined(dist) && dist >= 0){
		level.spike_attract_dist = dist;
	}
}

//Call On: Player
function spikeLauncherWatcher(){
	self weaponobjects::createSpikeLauncherWatcher("spike_launcher");
	spike_watcher = self weaponobjects::createWeaponObjectWatcher("spike_charge", self.team);
	spike_watcher.onSpawn = &spikeWatcher;
}

//Call On: Player
//Callback on connect
function spikeLauncherTutorialWatcher(){
	wpn_spike_launcher = GetWeapon("spike_launcher");
	self.spike_launcher_tutorial_complete = false;
	w_current = self GetCurrentWeapon();
	while(!self.spike_launcher_tutorial_complete){
		if(w_current == wpn_spike_launcher){
			self detonateWaitTill(wpn_spike_launcher);
		}else{
			self waittill("weapon_change_complete", w_current);
		}
	}
}

//Call On: Player
function detonateWaitTill(wpn_spike_launcher){
	self endon("death");
	self waittill("weapon_fired", w_current);
	if(w_current == wpn_spike_launcher){
		wait(2);
		self thread spikeLauncherTutorialHUD();
		self util::waittill_any("detonate", "last_stand_detonate");
		self.spike_launcher_tutorial_complete = true;
	}
}

//Call On: Player
function spikeLauncherTutorialHUD(){
	self notify("spike_launcher_HUD");
	self endon("spike_launcher_HUD");
	font = "default";
	fontscale = 2;
	if(level.Splitscreen && !level.hidef){
		fontscale = 3;
	}
	txt = self hud::createFontString(font, fontscale);
	txt.vertalign = "bottom";
	txt.y = -100;
	txt.alpha = 0;
	txt SetText("PRESS ^3[{+melee}]^7 TO DETONATE SPIKE CHARGE");
	txt FadeOverTime(0.5);
	txt.alpha = 1;

	self util::waittill_any_timeout(20, "detonate", "last_stand_detonate");

	txt FadeOverTime(0.5);
	txt.alpha = 0;
	wait(0.5);
	txt Destroy();
}

//Call On: Player
//Callback on connect
function spikeUpgradeWatcher(){
	self.spike_pois = [];

	weapon = "spike_launcher_upgraded";
	watcher = self weaponobjects::createUseWeaponObjectWatcher(weapon, self.team);
	watcher.altName = "spike_charge_upgraded";
	watcher.altWeapon = GetWeapon("spike_charge_upgraded");
	watcher.altDetonate = false;
	watcher.watchForFire = true;
	watcher.hackable = true;
	watcher.hackerToolRadius = level.equipmentHackerToolRadius;
	watcher.hackerToolTimeMs = level.equipmentHackerToolTimeMs;
	watcher.headIcon = false;
	watcher.onDetonateCallback = &weaponobjects::spikeDetonate;
	watcher.onStun = &weaponobjects::weaponStun;
	watcher.stunTime = 1;
	watcher.ownerGetsAssist = true;
	watcher.detonateStationary = false;
	watcher.detonationDelay = 0.0;
	watcher.detonationSound = "wpn_claymore_alert";
	watcher.onDetonateHandle = &upgradedSpikesDetonating;
	self thread upgradedSpikeLauncherUpgradedItemCountChanged(watcher);

	upgrade_spike_watcher = self weaponobjects::createWeaponObjectWatcher("spike_charge_upgraded", self.team);
	upgrade_spike_watcher.onSpawn = &upgradedSpikeWatcher;
	upgrade_spike_watcher.onDetonateCallback = &endSpikeAttractionOnDeath;
}

//Call On: Player
function upgradedSpikesDetonating(watcher){
	spike_count = weaponobjects::getSpikeLauncherActiveSpikeCount(watcher);
	if ( spike_count > 0 )
	{
		self SetControllerUIModelValue( "spikeLauncherCounter.blasting", 1 );
		wait 2;
		self SetControllerUIModelValue( "spikeLauncherCounter.blasting", 0 );
	}
}

//Call On: Player
function upgradedSpikeLauncherUpgradedItemCountChanged(watcher){
	self notify("uSLUICC");
	self endon("uSLUICC");
	self endon("death");
	last_item_count = undefined;
	while(true){
		self waittill("weapon_change", weapon);
		while(weapon.name == "spike_launcher_upgraded"){
			current_item_count = weaponobjects::getSpikeLauncherActiveSpikeCount(watcher);
			if(current_item_count !== last_item_count){
				self SetControllerUIModelValue("spikeLauncherCounter.spikesReady", current_item_count);
				last_item_count = current_item_count;
			}
			wait(0.1);
			weapon = self GetCurrentWeapon();
		}
	}
}

//Call On: The spawned bolt
function upgradedSpikeWatcher(watcher, owner){
	IPrintLn("spike_fired");
	self endon("death");
	self thread detonateAfterTime(SPIKE_CHARGE_TIME, owner);
	self util::waitTillNotMoving();
	//the above filters only those spawned on a surface in

	DEFAULT(level.spike_pois, []);
	
	//Get nav mesh position near this spike
	b_valid_poi = zm_utility::check_point_in_enabled_zone(self.origin, undefined, undefined);
	v_valid_poi = self move_valid_poi_to_navmesh(b_valid_poi);
	if(v_valid_poi != (0, 0, 0)){
		spike_poi = Spawn("script_origin", v_valid_poi);
		spike_poi zm_utility::create_zombie_point_of_interest(
			level.spike_attract_dist,
			level.num_spike_attractors,
			10000);
		spike_poi thread zm_utility::create_zombie_point_of_interest_attractor_positions(
			4, level.spike_attract_dist_diff
		);
		//spike_poi thread zm_utility::wait_for_attractor_positions_complete();
		array::add(level.spike_pois, spike_poi);
	}
}

//Call On: The spawned bolt/spike
//Returns a valid poi location
//If no valid location found, returns (0, 0, 0)
function move_valid_poi_to_navmesh(b_valid_poi){
	v_valid_poi = (0, 0, 0);
	if(IsPointOnNavMesh(self.origin)){
		v_valid_poi = self.origin;
	}else{
		//Find results on the nav mesh to make POI
		query_result = PositionQuery_Source_Navigation(
			self.origin, 0,
			POI_MAX_RADIUS,
			POI_HALF_HEIGHT,
			POI_INNER_SPACING,
			POI_RADIUS_FROM_EDGES
		);
		if(query_result.data.size > 0){
			foreach(point in query_result.data){
				//Check not too far off
				height_delta = Abs(self.origin[2] - point.origin[2]);
				if(!(height_delta > POI_HEIGHT)){
					//Do bullet trace to make sure not going between walls
					start = point.origin + (0, 0, 20);
					end = self.origin + (0, 0, 20);
					if(BulletTracePassed(start, end, false, self, undefined, false, false)){
						//make the poi this valid location
						v_valid_poi = point.origin;
						break; //end the loop as point found
					}
				}
			}
		}
	}
	return v_valid_poi;
}

//Call On: The spawned bolt/spike
function endSpikeAttractionOnDeath(attacker, weapon, target){
	self thread weaponobjects::spikeDetonate(attacker, weapon, target);
	foreach(poi in level.spike_pois){
		//NOT WORKING AT THE MOMENT
		poi zm_utility::deactivate_zombie_point_of_interest();
		poi notify("death");
		poi Delete();
	}
	self notify("death");
	level.spike_pois = [];
}

//Call On: The spawned bolt
function spikeWatcher(watcher, owner){
	IPrintLn("spike_fired");
	self thread detonateAfterTime(SPIKE_CHARGE_TIME, owner);
}

//Call On: spawned spike
function detonateAfterTime(time, player){
	player endon("detonate");
	IPrintLn("called");
	self util::waitTillNotMoving();
	wait(time);
	IPrintLn("detonate");
	//self endSpikeAttractionOnDeath();
	player notify("detonate");
}
