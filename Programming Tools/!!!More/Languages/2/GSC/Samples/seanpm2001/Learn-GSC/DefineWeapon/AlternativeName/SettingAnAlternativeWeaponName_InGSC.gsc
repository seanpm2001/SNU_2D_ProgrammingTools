function spikeLauncherTutorialHUD(){
	self notify("spike_launcher_HUD");
	self endon("spike_launcher_HUD");
	watcher.altName = "spike_charge_upgraded";
}
return spikeLauncherTutorialHUD();
