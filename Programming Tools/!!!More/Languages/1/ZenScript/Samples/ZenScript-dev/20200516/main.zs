import mods.thaumcraft.Infusion;
import mods.thaumcraft.ArcaneWorkbench;
import thaumcraft.aspect.CTAspectStack;
import crafttweaker.item.IItemTransformer;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IItemStack;
import mods.immersiveengineering.AlloySmelter;
import mods.thermalexpansion.Insolator;

// 32*sixaspect = <aspect:Terra>*32, <aspect:ignis>*32, <aspect:aqua>*32, <aspect:ordo>*32, <aspect:perditio>;
// 2020.5.17 更新

recipes.remove(<ic2:crafting:1>);
recipes.addShaped(<ic2:crafting:1>*2, [[<immersiveengineering:material:20>, <immersiveengineering:material:20>, <immersiveengineering:material:20>], [<immersiveengineering:material:20>, <ore:plateIron>, <immersiveengineering:material:20>], [<ore:dustRedstone>, <ore:itemRubber>, <ore:dustRedstone>]]);
// 电路板

recipes.remove(<thermalexpansion:frame>);
recipes.addShaped(<thermalexpansion:frame>, [[<ore:ingotConstructionAlloy>, <appliedenergistics2:quartz_glass>, <ore:ingotConstructionAlloy>], [<appliedenergistics2:quartz_glass>, <enderio:item_material:11>, <appliedenergistics2:quartz_glass>], [<ore:ingotConstructionAlloy>, <appliedenergistics2:quartz_glass>, <ore:ingotConstructionAlloy>]]);
// 机器框架(热力)

recipes.remove(<thermalexpansion:frame:64>);
recipes.addShaped(<thermalexpansion:frame:64>, [[<ore:ingotRedstoneAlloy>, <appliedenergistics2:quartz_glass>, <ore:ingotRedstoneAlloy>], [<appliedenergistics2:quartz_glass>, <enderio:item_material:11>, <appliedenergistics2:quartz_glass>], [<ore:ingotRedstoneAlloy>, <appliedenergistics2:quartz_glass>, <ore:ingotRedstoneAlloy>]]);
// 设备框架(热力)

recipes.remove(<enderio:item_material:51>);
recipes.addShaped(<enderio:item_material:51>, [[<ic2:dust:6>, <ic2:crafting:25>, <ic2:dust:6>], [<ic2:crafting:25>, <enderio:item_material:50>, <ic2:crafting:25>], [<ic2:dust:6>, <ic2:crafting:25>, <ic2:dust:6>]]);
// 机器涂料

recipes.remove(<environmentaltech:structure_frame_1>);
<environmentaltech:structure_frame_1>.addTooltip("§6使用无尽贪婪工作台§4合成此物品");
mods.avaritia.ExtremeCrafting.addShaped("structure_frame_1", <environmentaltech:structure_frame_1>*6, [
    [null,null,null,null,null,null,null,null,null],
    [null, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <ore:gemDiamond>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <ore:gemDiamond>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <environmentaltech:litherite_crystal>, <minecraft:concrete_powder:15>, <minecraft:concrete_powder:15>, <minecraft:concrete_powder:15>, <environmentaltech:litherite_crystal>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <environmentaltech:litherite_crystal>, <minecraft:concrete_powder:15>, <ore:itemSimpleMachineChassi>, <minecraft:concrete_powder:15>, <environmentaltech:litherite_crystal>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <environmentaltech:litherite_crystal>, <minecraft:concrete_powder:15>, <minecraft:concrete_powder:15>, <minecraft:concrete_powder:15>, <environmentaltech:litherite_crystal>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <ore:gemDiamond>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <ore:gemDiamond>, <ore:plateBrass>, null], 
    [null, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, <ore:plateBrass>, null],
    [null,null,null,null,null,null,null,null,null]
]);
// 一级结构方块

// 2020.5.22 更新

<environmentaltech:structure_frame_2>.addTooltip("§6请使用注魔合成");
recipes.remove(<environmentaltech:structure_frame_2>);
mods.thaumcraft.Infusion.registerRecipe("tier2", "", <environmentaltech:structure_frame_2>, 3,[<aspect:aer>*8, <aspect:ignis>*8], <environmentaltech:structure_frame_1>, [<enderio:item_material>, <appliedenergistics2:material:12>, <appliedenergistics2:material:10>, <thaumicenergistics:coalescence_core>, <thaumicenergistics:diffusion_core>, <thaumicenergistics:essentia_component_1k>, <thaumcraft:plate>, <thaumcraft:metal_thaumium>]);
// 二级结构方块 

<environmentaltech:structure_frame_3>.addTooltip("§6请使用注魔合成");
recipes.remove(<environmentaltech:structure_frame_3>);
mods.thaumcraft.Infusion.registerRecipe("tier3", "", <environmentaltech:structure_frame_3>, 5,[<aspect:aer>*32, <aspect:ignis>*32], <environmentaltech:structure_frame_2>, [<ore:blockLitherite>, <draconicevolution:particle_generator>, <minecraft:ender_eye>, <minecraft:ender_eye>, <minecraft:nether_star>, <environmentaltech:modifier_null>, <environmentaltech:structure_panel>]);
// 三级结构方块

mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:infusion_matrix>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("I", "", 1, [<aspect:aqua>*16, <aspect:ignis>*16, <aspect:terra>*16, <aspect:aer>*16, <aspect:ordo>*16, <aspect:perditio>*16], <thaumcraft:infusion_matrix>, [[<thaumcraft:salis_mundus>, <thaumcraft:plate>, <thaumcraft:salis_mundus>], [<thaumcraft:plate>, <minecraft:tnt>, <thaumcraft:plate>], [<thaumcraft:salis_mundus>, <thaumcraft:plate>, <thaumcraft:salis_mundus>]]);
// 注魔矩阵

recipes.remove(<appliedenergistics2:interface>);
recipes.addShaped(<appliedenergistics2:interface>, [[<appliedenergistics2:quartz_glass>, <thermaldynamics:duct_32>, <appliedenergistics2:quartz_glass>], [<ore:pearlFluix>, <ore:gemQuartz>, <ore:pearlFluix>], [<appliedenergistics2:quartz_glass>, <thermaldynamics:duct_32>, <appliedenergistics2:quartz_glass>]]);
// ME 接口

recipes.remove(<appliedenergistics2:controller>);
recipes.addShaped(<appliedenergistics2:controller>, [[<appliedenergistics2:sky_stone_block>, <appliedenergistics2:material:23>, <appliedenergistics2:sky_stone_block>], [<appliedenergistics2:material:24>, <appliedenergistics2:part:140>, <appliedenergistics2:material:22>], [<appliedenergistics2:sky_stone_block>, <ore:beeComb>, <appliedenergistics2:sky_stone_block>]]);
// ME 控制器

recipes.remove(<environmentaltech:laser_core>);
<environmentaltech:laser_core>.addTooltip("§a无法使用该物品搭建结构");
// 激光核心

<environmentaltech:void_ore_miner_cont_1>.addTooltip("§a仅用于合成");
// 激光透镜

mods.thaumcraft.Infusion.registerRecipe("MK1", "", <modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:tier1"}), 5, [<aspect:instrumentum>*32, <aspect:vitium>*32, <aspect:humanus>*32, <aspect:machina>*32], <environmentaltech:void_ore_miner_cont_1>, [<ore:paper>, <ore:oreGold>, <ore:oreIron>, <ore:oreCopper>, <ore:oreTin>, <ore:oreSilver>, <ore:oreNickel>, <enderio:item_material:54>, <forestry:broken_bronze_pickaxe>, <forestry:broken_bronze_shovel>]);
// MK1 蓝图

recipes.remove(<enderio:item_material:52>);
recipes.addShaped(<enderio:item_material:52>*6, [[<ic2:dust:6>, <thermalfoundation:material:1027>, <ic2:dust:6>], [<thermalfoundation:material:1027>, <ore:dustObsidian>, <thermalfoundation:material:1027>], [<ic2:dust:6>, <thermalfoundation:material:1027>, <ic2:dust:6>]]);
// 灵魂框架涂料粉

recipes.addShapeless(<thermalfoundation:material:2052>, [<ore:dustStone>, <ore:dustObsidian>]);
// 岩石

recipes.addShapeless(<thermalfoundation:material:2050>, [<ore:dustSaltpeter>, <ore:dustStone>]);
// 狂风

recipes.addShapeless(<thermalfoundation:material:2048>, [<ore:blockIce>, <ore:dustStone>]);
// 暴雪

// 2020.5.23 更新

recipes.remove(<thermalexpansion:machine:6>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_6", <thermalexpansion:machine:6>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <environmentaltech:litherite_crystal>, <minecraft:red_nether_brick>, <minecraft:red_nether_brick>, <minecraft:red_nether_brick>, <environmentaltech:litherite_crystal>, null,null],
    [null,null, <minecraft:bucket>, <minecraft:magma_cream>, <minecraft:magma_cream>, <minecraft:magma_cream>, <minecraft:bucket>, null,null], 
    [null,null, <thermalexpansion:tank>, <minecraft:magma>, <ic2:te:4>, <minecraft:magma>, <thermalexpansion:tank>, null,null], 
    [null,null, <minecraft:bucket>, <thermalexpansion:frame:64>, <minecraft:lava_bucket>, <thermalexpansion:frame>, <minecraft:bucket>, null,null], 
    [null,null, <environmentaltech:litherite_crystal>, <minecraft:red_nether_brick>, <minecraft:red_nether_brick>, <minecraft:red_nether_brick>, <environmentaltech:litherite_crystal>, null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 熔岩炉 

recipes.remove(<thermalexpansion:machine:5>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_5", <thermalexpansion:machine:5>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <ore:stone>, <ore:stone>, <ore:stone>, <ore:stone>, <ore:stone>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <environmentaltech:litherite_crystal>, <immersiveengineering:tool>, <environmentaltech:litherite_crystal>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <thermalexpansion:frame>, <appliedenergistics2:condenser>, <thermalexpansion:frame:64>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <environmentaltech:litherite_crystal>, <ic2:te:43>, <environmentaltech:litherite_crystal>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <ore:stone>, <ore:stone>, <ore:stone>, <ore:stone>, <ore:stone>, null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 压缩机 

recipes.remove(<thermalexpansion:machine:3>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_3", <thermalexpansion:machine:3>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, null,null], 
    [null,null, <ore:reBattery>, <environmentaltech:litherite_crystal>, <ic2:te:46>, <environmentaltech:litherite_crystal>, <ore:reBattery>, null,null], 
    [null,null, <minecraft:lava_bucket>, <environmentaltech:litherite_crystal>, <ic2:te:54>, <environmentaltech:litherite_crystal>, <minecraft:lava_bucket>, null,null], 
    [null,null, <ore:reBattery>, <thermalexpansion:frame:64>, <ic2:te:46>, <thermalexpansion:frame>, <ore:reBattery>, null,null], 
    [null,null, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, null,null], 
    [null,null,null,null,null,null,null,null,null], 
    [null,null,null,null,null,null,null,null,null]
]);
// 感应炉 

recipes.remove(<thermalexpansion:machine:1>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_1", <thermalexpansion:machine:1>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <appliedenergistics2:crank>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, null,null], 
    [null,null, <ore:gravel>, <ore:gearEnergized>, <appliedenergistics2:grindstone>, <ore:gearEnergized>, <ore:gravel>, null,null], 
    [null,null, <ore:gravel>, <sakura:stone_mortar>, <ore:ic2Macerator>, <sakura:stone_mortar>, <ore:gravel>, null,null], 
    [null,null, <ore:sand>, <thermalexpansion:frame>, <ore:gearEnergized>, <thermalexpansion:frame:64>, <ore:sand>, null,null], 
    [null,null, <ore:sand>, <modularmachinery:itemmodularium>, <advanced_solar_panels:crafting:7>, <modularmachinery:itemmodularium>, <ore:sand>,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 磨粉机 

recipes.remove(<thermalexpansion:machine>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine", <thermalexpansion:machine>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_crystal>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <thermalexpansion:frame>, <environmentaltech:litherite_crystal>, <thermalexpansion:frame:64>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <ic2:te:46>, <ic2:te:46>, <ic2:te:46>, <thaumcraft:stone_arcane>, null,null], 
    [null,null, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thermalfoundation:material:513>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 红石炉 

recipes.remove(<thermalexpansion:machine:8>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_8", <thermalexpansion:machine:8>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <environmentaltech:litherite_crystal>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <environmentaltech:litherite_crystal>, null,null], 
    [null,null, <minecraft:bucket>, <thermalexpansion:tank>, <thaumcraft:stone_arcane>, <thermalexpansion:tank>, <minecraft:bucket>, null,null], 
    [null,null, <minecraft:bucket>, <ore:gearEnergized>, <ic2:te:42>, <ore:gearEnergized>, <minecraft:bucket>, null,null], 
    [null,null, <minecraft:bucket>, <thermalexpansion:frame:64>, <minecraft:cauldron>, <thermalexpansion:frame>, <minecraft:bucket>, null,null], 
    [null,null, <environmentaltech:litherite_crystal>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <environmentaltech:litherite_crystal>, null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 流体转置机 

recipes.remove(<thermalexpansion:machine:15>);
mods.avaritia.ExtremeCrafting.addShaped("thermal_machine_15", <thermalexpansion:machine:15>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null, <environmentaltech:litherite_crystal>, <environmentaltech:litherite_slab>, <environmentaltech:litherite_slab>, <environmentaltech:litherite_slab>, <environmentaltech:litherite_crystal>, null,null], 
    [null,null,<environmentaltech:litherite_crystal>, <thermalexpansion:frame>, <minecraft:lava_bucket>, <thermalexpansion:frame:64>, <environmentaltech:litherite_crystal>,null,null], 
    [null,null,<ore:obsidian>, <ore:gearInvar>, <ore:listAllwater>, <ore:gearInvar>, <ore:obsidian>,null,null], 
    [null,null,<ore:obsidian>, <ore:obsidian>, <minecraft:cauldron>, <ore:obsidian>, <ore:obsidian>,null,null], 
    [null,null,<modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 造石机 
recipes.remove(<modularmachinery:blockcontroller>);
recipes.addShaped(<modularmachinery:blockcontroller>, [[<appliedenergistics2:part:56>, <thermalexpansion:augment:432>, <appliedenergistics2:part:56>], [<modularmachinery:blockcasing>, <appliedenergistics2:controller>, <modularmachinery:blockcasing>], [<modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>]]);
// 机械控制器

recipes.addShaped(<modularmachinery:blockoutputbus:6>, [[<appliedenergistics2:smooth_sky_stone_chest>, <appliedenergistics2:part:260>, <appliedenergistics2:smooth_sky_stone_chest>], [<modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:3>, <modularmachinery:blockcasing:4> ], [<modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>]]);
// 白嫖超级物品输出入仓 

recipes.addShaped(<modularmachinery:blockinputbus:6>, [[<appliedenergistics2:smooth_sky_stone_chest>, <appliedenergistics2:part:240>, <appliedenergistics2:smooth_sky_stone_chest>], [<modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:3>, <modularmachinery:blockcasing:4> ], [<modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>, <modularmachinery:blockcasing:4>]]);
// 白嫖超级物品输出入仓 

recipes.remove(<modularmachinery:blockenergyinputhatch:7>);
recipes.addShaped(<modularmachinery:blockenergyinputhatch:7>, [[<enderio:item_conduit_facade>, <thermalfoundation:material:1025>, <enderio:item_conduit_facade>], [<enderio:item_conduit_facade>, <thermalfoundation:material:1025>, <enderio:item_conduit_facade>], [<modularmachinery:blockcasing:4>, <appliedenergistics2:part:260>, <modularmachinery:blockcasing:4>]]);
// 白嫖能源输出仓 

recipes.remove(<modularmachinery:blockenergyinputhatch:7>);
recipes.addShaped(<modularmachinery:blockenergyinputhatch:7>, [[<enderio:item_conduit_facade>, <thermalfoundation:material:1025>, <enderio:item_conduit_facade>], [<enderio:item_conduit_facade>, <thermalfoundation:material:1025>, <enderio:item_conduit_facade>], [<modularmachinery:blockcasing:4>, <appliedenergistics2:part:240>, <modularmachinery:blockcasing:4>]]);
// 白嫖能源输入仓 

// 2020.5.24 更新

recipes.remove(<avaritia:compressed_crafting_table>);
recipes.addShaped(<avaritia:compressed_crafting_table>, [[<ic2:crafting:17>, <enderio:block_infinity:1>, <ic2:crafting:17>], [<enderio:block_infinity:1>, <minecraft:crafting_table>, <enderio:block_infinity:1>], [<ic2:crafting:17>, <enderio:block_infinity:1>, <ic2:crafting:17>]]);
// 压缩工作台 

recipes.remove(<avaritia:double_compressed_crafting_table>);
mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<avaritia:double_compressed_crafting_table>, <avaritia:compressed_crafting_table>, 100);
// 双重压缩工作台

mods.avaritia.ExtremeCrafting.addShaped("ultimate_stew", <avaritia:ultimate_stew>*4, [
    [<ore:cropApple>, <minecraft:mushroom_stew>, <ore:bread>, <ore:listAllmeatraw>, <ore:listAllmeatcooked>, <minecraft:golden_apple>, <ore:listAllfishraw>, <ore:listAllfishraw>, <ore:listAllfishraw>],
    [<minecraft:cake>, <ore:listAllcookie>, <ore:listAllfruit>, <ore:listAllmeatraw>, <ore:listAllmeatcooked>, <ore:listAllchickenraw>, <ore:listAllchickencooked>, <minecraft:rotten_flesh>, <minecraft:spider_eye>], 
    [<ore:listAllveggie>, <ore:listAllveggie>, <minecraft:baked_potato>, <minecraft:pumpkin_pie>, <ore:listAllmeatraw>, <ore:listAllmeatcooked>, <minecraft:beetroot_soup>, <minecraft:poisonous_potato>, <minecraft:rabbit_stew>],
    [<ore:listAllmeatraw>, <ore:nuggetCosmicNeutronium>, <cuisine:food:5>, <cuisine:food:6>, <cuisine:food:7>, <cuisine:food:8>,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// FIX超级堡 

recipes.remove(<ic2:te:54>);
recipes.addShaped(<ic2:te:54>, [[<ore:blockGlass>, <ore:blockGlass>, <ore:blockGlass>], [<ic2:te:44>, <ic2:resource:13>, <ic2:te:44>], [<ore:circuitBasic>, <immersiveengineering:metal_decoration0>, <ore:circuitBasic>]]);
// ic2 感应炉

recipes.remove(<ic2:te:43>);
recipes.addShaped(<ic2:te:43>, [[<thaumcraft:stone_arcane>, <ic2:forge_hammer>.anyDamage(), <thaumcraft:stone_arcane>], [<thaumcraft:stone_arcane>, <ic2:resource:12>, <thaumcraft:stone_arcane>], [<thaumcraft:stone_arcane>, <ic2:crafting:1>, <thaumcraft:stone_arcane>]]);
// ic2 压缩机

recipes.remove(<ic2:te:55>);
recipes.addShaped(<ic2:te:55>, [[<ic2:forge_hammer>.anyDamage(), <ic2:crafting:1>, <ic2:cutter>.anyDamage()], [<ic2:tool_box>, <ic2:resource:12>, <ic2:tool_box>], [<ic2:crafting:5>, <ic2:crafting:5>, <ic2:crafting:5>]]);
// ic2 金属成型机

recipes.remove(<ic2:te:47>);
recipes.addShaped(<ic2:te:47>, [[<ore:itemFlint>, <ore:itemFlint>, <ore:itemFlint>], [<ore:stone>, <ic2:resource:12>, <ore:stone>], [<ore:gearIron>, <ic2:crafting:1>, <ore:gearIron>]]);
// ic2 打粉机

// 2020.5.29 更新

mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:pedestal_arcane>);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe("jizuo", "", 10, [<aspect:ignis>*2, <aspect:terra>*2], <thaumcraft:pedestal_arcane>*4, [[<thaumcraft:stone_arcane>, <ore:slabSteel>, <thaumcraft:stone_arcane>], [<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>], [<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>]]);
// 奥术基座

recipes.remove(<appliedenergistics2:part:220>);
val icp = <enderio:item_conduit_probe>.anyDamage().transformDamage();
mods.avaritia.ExtremeCrafting.addShaped("appliedenergistics2_part_220", <appliedenergistics2:part:220>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null, null, <ore:ingotVibrantAlloy>, <ore:itemChassiParts>, null,null,null], 
    [null,null,null, <ore:itemChassiParts>, <ore:itemChassiParts>, <thermalexpansion:cache>, null,null,null], 
    [null,null,<ore:itemChassiParts>, icp, <enderio:block_end_iron_bars>, <thermalexpansion:cache>, null,null,null], 
    [null,null,null, <ore:itemChassiParts>, <ore:itemChassiParts>, <thermalexpansion:cache>, null,null,null], 
    [null,null,null, null, <ore:ingotVibrantAlloy>, <ore:itemChassiParts>, null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);
// 修改了 ME 存储总线的合成

<variedcommodities:spell_dark>.displayName = "§7终极核心";
// 更名

mods.thaumcraft.Infusion.registerRecipe("hechenghexing", "", <variedcommodities:spell_dark>, 20, [<aspect:potentia>*16, <aspect:instrumentum>*16, <aspect:fabrico>*16, <aspect:auram>*8, <aspect:humanus>*8], <avaritia:double_compressed_crafting_table>, [<thaumcraft:causality_collapser>, <ore:ingotVoid>, <thaumadditions:mithrillium_ingot>, <environmentaltech:litherite_crystal>, <appliedenergistics2:material:7>, <ore:blockDiamond>, <thermalfoundation:material:1024>, <modularmachinery:itemmodularium>,]);
// 合成台核心 无尽工作台核心

mods.inworldcrafting.FluidToFluid.transform(<liquid:cryotheum>, <liquid:water>, [<thermalfoundation:material:1025>]);
// 凛冰液体转化

recipes.remove(<avaritia:extreme_crafting_table>);
mods.inworldcrafting.FluidToItem.transform((<avaritia:extreme_crafting_table>), <liquid:cryotheum>, [<variedcommodities:spell_dark>], true);
// 终极工作台

// 2020.7.26 凌六更新

mods.thaumcraft.Crucible.registerRecipe("prismarine_shard", "", <minecraft:prismarine_shard>, <minecraft:quartz>, [<aspect:alienis>*16,<aspect:aqua>*32,<aspect:ordo>*16]);
// 海晶碎片

mods.immersiveengineering.AlloySmelter.addRecipe(<modularmachinery:itemmodularium>*2, <ore:dustRedstone>, <ore:dustGlowstone>, 400);
mods.immersiveengineering.AlloySmelter.addRecipe(<modularmachinery:itemmodularium>*4, <ore:dustRedstone>*2, <ore:itemClayedGlowstone>, 200);
// 模块锭

recipes.remove(<immersiveengineering:stone_decoration:10>);
recipes.addShaped(<immersiveengineering:stone_decoration:10>, [[<minecraft:nether_brick>, <ic2:refractory_bricks>, <minecraft:nether_brick>], [<ic2:refractory_bricks>, <ic2:refractory_bricks>, <ic2:refractory_bricks>], [<minecraft:nether_brick>, <ic2:refractory_bricks>, <minecraft:nether_brick>]]);
// 窑砖

<thaumcraft:nugget:10>.addTooltip("§a开采无需熔炼的矿石或在炼狱熔炉熔炼矿物获得。");
<thaumcraft:nugget:10>.addTooltip("§b掉率十分感人)");

recipes.addShaped(<modularmachinery:blockcasing:1>, [[<modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>],[<ic2:crafting:32>, <ic2:crafting:32>, <ic2:crafting:32>],[<modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>]]);
// 机械通风口

recipes.addShaped(<modularmachinery:blockcasing:3>, [[<modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <ore:gearIron>],[<modularmachinery:blockcasing>, <ore:gearSteel>, <ore:gearIron>],[<modularmachinery:blockcasing>, <modularmachinery:blockcasing>, <modularmachinery:blockcasing>]]);
// 机械齿轮箱

mods.inworldcrafting.ExplosionCrafting.explodeItemRecipe(<environmentaltech:thermal_cell>*2, <immersiveengineering:metal_device1:1>, 70);
// 热力单元

mods.thermalexpansion.Infuser.addRecipe(<draconicevolution:draconium_block:1>, <draconicevolution:draconium_block>, 1000000);
// 充能龙块

<ic2:wall>.addTooltip("§a使用相应颜色的刷子右键建筑泡沫墙");
// 添加注释

mods.inworldcrafting.FluidToItem.transform(<thaumcraft:stone_ancient>, <liquid:mana>, [<thaumcraft:stone_eldritch_tile>], true);
mods.inworldcrafting.FluidToItem.transform(<thaumcraft:stone_eldritch_tile>, <liquid:ic2uu_matter>, [<thaumcraft:stone_arcane>], true);
// 邪术石 荒古石

recipes.addShapeless(<thaumcraft:pillar_arcane>, [<thaumcraft:stone_arcane>, <thaumcraft:stone_arcane>]);
// 注魔柱

mods.thaumcraft.Infusion.registerRecipe("pillar_ancient", "", <thaumcraft:pillar_ancient>*4, 20, [<aspect:perditio>*128, <aspect:vacuos>*128, <aspect:auram>*64, <aspect:herba>*64, <aspect:alienis>*128, <aspect:caeles>*64], <thaumcraft:stone_ancient>, [<thaumadditions:seal>, <thaumcraft:inlay>, <thaumcraft:inlay>, <thaumcraft:curio:1>, <thaumadditions:taintkin_lit>, <thaumcraft:void_seed>, <thaumcraft:metal_alchemical>, <thaumcraft:matrix_speed>]);
// 荒古注魔柱

mods.thaumcraft.Infusion.registerRecipe("pillar_eldritch", "", <thaumcraft:pillar_eldritch>*4, 20, [<aspect:aer>*300, <aspect:terra>*300, <aspect:ignis>*300, <aspect:aqua>*300, <aspect:ordo>*300, <aspect:perditio>*300], <thaumcraft:stone_eldritch_tile>, [<draconicevolution:chaos_shard:2>, <thaumcraft:mechanism_complex>, <thaumcraft:stabilizer>]);
// 邪术注魔柱

recipes.remove(<immersiveengineering:metal_device1:13>);
recipes.addShaped(<immersiveengineering:metal_device1:13>*2, [[<advanced_solar_panels:crafting:6>, <modularmachinery:blockoutputbus:6>, <advanced_solar_panels:crafting:6>], [<environmentaltech:mica>, <forestry:humus>, <environmentaltech:mica>], [<sakura:maple_log>, <modularmachinery:blockfluidinputhatch:7>, <sakura:maple_log>]]);
// 园艺玻璃罩
