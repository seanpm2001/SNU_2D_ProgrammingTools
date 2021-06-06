#loader contenttweaker
#priority 2000

import mods.contenttweaker.Item;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.CreativeTab;
import crafttweaker.item.IItemStack as IItemStack;

val starCraftCrativeTab = VanillaFactory.createCreativeTab("tab", <item:minecraft:nether_star>);
starCraftCrativeTab.register();

var woodenShears = VanillaFactory.createItem("wooden_shears");
woodenShears.maxStackSize = 1;
woodenShears.maxDamage = 233;
woodenShears.creativeTab = <creativetab:tab>;
woodenShears.register();

var clayFurnace = VanillaFactory.createItem("clay_furnace");
clayFurnace.maxStackSize = 16;
clayFurnace.creativeTab = <creativetab:tab>;
clayFurnace.register();

var magicLog = VanillaFactory.createBlock("magic_log", <blockmaterial:wood>);
magicLog.toolClass = "axe";
magicLog.toolLevel = 1.0;
magicLog.blockSoundType = <soundtype:wood>;
magicLog.fullBlock = true;
magicLog.creativeTab = <creativetab:tab>;
magicLog.register();

var myHammer = VanillaFactory.createItem("hammer");
myHammer.maxStackSize = 1;
myHammer.maxDamage = 1000;
myHammer.creativeTab = <creativeTab:tab>;
myHammer.register();

var myProcessor = VanillaFactory.createItem("processor");
myProcessor.maxStackSize = 64;
myProcessor.creativeTab = <creativeTab:tab>;
myProcessor.glowing = true;
myProcessor.register();

var dragonCore = VanillaFactory.createItem("dragon");
dragonCore.maxStackSize = 8;
dragonCore.creativeTab = <creativeTab:tab>;
dragonCore.glowing = true;
dragonCore.register();

var mySkull = VanillaFactory.createBlock("skull_block", <blockmaterial:wood>);
mySkull.toolClass = "pickaxe";
mySkull.toolLevel = 1.0;
mySkull.blockSoundType = <soundtype:wood>;
mySkull.fullBlock = true;
mySkull.creativeTab = <creativetab:tab>;
mySkull.register();

var myStone = VanillaFactory.createBlock("magic_stone", <blockmaterial:wood>);
myStone.toolClass = "pickaxe";
myStone.toolLevel = 1.0;
myStone.blockSoundType = <soundtype:wood>;
myStone.fullBlock = true;
myStone.creativeTab = <creativetab:tab>;
myStone.register();

var myDust1 = VanillaFactory.createItem("calcium_carbonate_dust");
myDust1.maxStackSize = 64;
myDust1.creativeTab = <creativeTab:tab>;
myDust1.register();
