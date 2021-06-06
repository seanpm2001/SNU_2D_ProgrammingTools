#loader contenttweaker
/*
    StarCraft_Test ContentTweaker Items Script.
*/
import mods.contenttweaker.Block;
import mods.contenttweaker.VanillaFactory;

val TestBlock as Block = VanillaFactory.createBlock("test_block", <blockmaterial:rock>);
TestBlock.lightValue = 15;
TestBlock.gravity = true;
TestBlock.beaconBase = true;
TestBlock.blockHardness = 50.0;
TestBlock.blockResistance = 100.0;
TestBlock.blockSoundType = <soundtype:sand>;
TestBlock.toolClass = "pickaxe";
TestBlock.toolLevel = 1;
TestBlock.register();

var enrichedCobbleStone as Block = VanillaFactory.createBlock("enriched_cobblestone", <blockmaterial:rock>);
enrichedCobbleStone.toolClass = "pickaxe";
enrichedCobbleStone.toolLevel = 0;
enrichedCobbleStone.register();
