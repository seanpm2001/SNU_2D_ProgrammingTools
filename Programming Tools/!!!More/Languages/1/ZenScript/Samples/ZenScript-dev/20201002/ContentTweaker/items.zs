#loader contenttweaker
/*
    StarCraft_Test ContentTweaker Items Script.
*/

import mods.contenttweaker.Item;
import mods.contenttweaker.ResourceLocation;
import mods.contenttweaker.VanillaFactory;

val Black as Item = VanillaFactory.createItem("black_matter");
Black.rarity = "UNCOMMON";
Black.maxStackSize = 64;
Black.creativeTab = <creativetab:materials.base>;
Black.register();

val Red as Item = VanillaFactory.createItem("red_matter");
Red.rarity = "UNCOMMON";
Red.maxStackSize = 64;
Red.creativeTab = <creativetab:materials.base>;
Red.register();

val Yellow as Item = VanillaFactory.createItem("yellow_matter");
Yellow.rarity = "UNCOMMON";
Yellow.maxStackSize = 64;
Yellow.creativeTab = <creativetab:materials.base>;
Yellow.register();

val Blue as Item = VanillaFactory.createItem("blue_matter");
Blue.rarity = "UNCOMMON";
Blue.maxStackSize = 64;
Blue.creativeTab = <creativetab:materials.base>;
Blue.register();

val Grey as Item = VanillaFactory.createItem("grey_matter");
Grey.rarity = "UNCOMMON";
Grey.maxStackSize = 64;
Grey.creativeTab = <creativetab:materials.base>;
Grey.register();

val Green as Item = VanillaFactory.createItem("green_matter");
Green.rarity = "UNCOMMON";
Green.maxStackSize = 64;
Green.creativeTab = <creativetab:materials.base>;
Green.register();

val Brown as Item = VanillaFactory.createItem("brown_matter");
Brown.rarity = "UNCOMMON";
Brown.maxStackSize = 64;
Brown.creativeTab = <creativetab:materials.base>;
Brown.register();

/*
val <color> as Item = VanillaFactory.createItem("<color>_matter");
<color>.rarity = "UNCOMMON";
<color>.maxStackSize = 64;
<color>.creativeTab = <creativetab:materials.base>;
<color>.register();
*/