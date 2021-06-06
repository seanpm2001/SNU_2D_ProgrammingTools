import crafttweaker.event.IBlockEvent;

var myGrey = <contenttweaker:grey_matter>;
var myBrown = <contenttweaker:brown_matter>;
var myGreen = <contenttweaker:green_matter>;
var myYellow = <contenttweaker:yellow_matter>;
var myBlue = <contenttweaker:blue_matter>;
var myRed = <contenttweaker:red_matter>;
var myBlack = <contenttweaker:black_matter>;

// 2×2合成
recipes.addShaped(<minecraft:log>, 
    [[<contenttweaker:brown_matter>, <contenttweaker:blue_matter>], 
    [<contenttweaker:blue_matter>, <contenttweaker:brown_matter>]]
);
// 橡胶树苗
recipes.addShaped(<ic2:sapling>, 
    [[<contenttweaker:grey_matter>, <contenttweaker:brown_matter>], 
    [<minecraft:sapling>, <contenttweaker:green_matter>]]
);
// 圆石
recipes.addShaped(<minecraft:cobblestone> * 2, 
    [[<ic2:dust:15>, <ic2:dust:15>], 
    [<ic2:dust:15>, <ic2:dust:15>]]
);
// 富集圆石
recipes.addShaped(<contenttweaker:enriched_cobblestone>, 
    [[myGrey, myGrey], 
    [myBrown, myGreen]]
);
// 白桦树苗
recipes.addShaped(<minecraft:sapling:2>, 
    [[<ic2:dust:15>, myGrey], 
    [myBlack, <contenttweaker:green_matter>]]
);
// 沙子
recipes.addShaped(<minecraft:sand> * 4, 
    [[<ic2:dust:15>, <minecraft:flint>], 
    [<minecraft:stone>, <minecraft:planks:2>]]
);
// 熔岩粘滑泥泞
recipes.addShaped(<tconstruct:soil:5> * 4, 
    [[<ore:gunpowder>, <ore:dustRedstone>], 
    [<minecraft:sand>, <contenttweaker:red_matter>]]
);
// 矿渣
recipes.addShaped(<immersiveengineering:material:7> * 4, 
    [[<minecraft:flint>, <contenttweaker:enriched_cobblestone>], 
    [<contenttweaker:enriched_cobblestone>, <minecraft:flint>]]
);
// 能源输入仓依次升级
recipes.addShaped(<modularmachinery:blockinputbus:2>, 
    [[<modularmachinery:blockinputbus:1>, <storagedrawers:upgrade_storage>],
    [<storagedrawers:upgrade_storage>, <modularmachinery:blockinputbus:1>]]
);
recipes.addShaped(<modularmachinery:blockinputbus:3>, 
    [[<modularmachinery:blockinputbus:2>, <storagedrawers:upgrade_storage:1>],
    [<storagedrawers:upgrade_storage:1>, <modularmachinery:blockinputbus:2>]]
);
recipes.addShaped(<modularmachinery:blockinputbus:5>, 
    [[<modularmachinery:blockinputbus:3>, <storagedrawers:upgrade_storage:2>],
    [<storagedrawers:upgrade_storage:2>, <modularmachinery:blockinputbus:3>]]
);
recipes.addShaped(<modularmachinery:blockinputbus:6>, 
    [[<modularmachinery:blockinputbus:5>, <storagedrawers:upgrade_storage:3>],
    [<storagedrawers:upgrade_storage:3>, <modularmachinery:blockinputbus:5>]]
);
// 能源输出仓依次升级
recipes.addShaped(<modularmachinery:blockenergyoutputhatch:2>, 
    [[<modularmachinery:blockenergyoutputhatch:1>, <storagedrawers:upgrade_storage>],
    [<storagedrawers:upgrade_storage>, <modularmachinery:blockenergyoutputhatch:1>]]
);
recipes.addShaped(<modularmachinery:blockenergyoutputhatch:3>, 
    [[<modularmachinery:blockenergyoutputhatch:2>, <storagedrawers:upgrade_storage:1>],
    [<storagedrawers:upgrade_storage:1>, <modularmachinery:blockenergyoutputhatch:2>]]
);
recipes.addShaped(<modularmachinery:blockenergyoutputhatch:4>, 
    [[<modularmachinery:blockenergyoutputhatch:3>, <storagedrawers:upgrade_storage:2>],
    [<storagedrawers:upgrade_storage:2>, <modularmachinery:blockenergyoutputhatch:3>]]
);
// 物品输出仓依次升级
recipes.addShaped(<modularmachinery:blockoutputbus:2>, 
    [[<modularmachinery:blockoutputbus:1>, <storagedrawers:upgrade_storage>], 
    [<storagedrawers:upgrade_storage>, <modularmachinery:blockoutputbus:1>]]
);
recipes.addShaped(<modularmachinery:blockoutputbus:3>, 
    [[<modularmachinery:blockoutputbus:2>, <storagedrawers:upgrade_storage:1>], 
    [<storagedrawers:upgrade_storage:1>, <modularmachinery:blockoutputbus:2>]]
);
recipes.addShaped(<modularmachinery:blockoutputbus:5>, 
    [[<modularmachinery:blockoutputbus:3>, <storagedrawers:upgrade_storage:2>], 
    [<storagedrawers:upgrade_storage:2>, <modularmachinery:blockoutputbus:3>]]
);
recipes.addShaped(<modularmachinery:blockoutputbus:6>, 
    [[<modularmachinery:blockoutputbus:5>, <storagedrawers:upgrade_storage:3>], 
    [<storagedrawers:upgrade_storage:3>, <modularmachinery:blockoutputbus:5>]]
);
// 3×3合成
// 石台阶
recipes.addShaped(<minecraft:stone_slab> * 6, 
    [[null,null,null], 
    [null,null,null], 
    [<minecraft:planks:2>, <contenttweaker:enriched_cobblestone>, <minecraft:planks:2>]]
);
// 砂砾
recipes.addShaped(<minecraft:gravel> * 8, 
    [[myYellow, myBlack, myRed], 
    [myBlue, <contenttweaker:enriched_cobblestone>, myGreen], 
    [myBrown, <minecraft:planks:2>, myGrey]]
);
// 泥土
recipes.addShaped(<minecraft:dirt>, 
    [[myBrown, myBrown, myBrown], 
    [myBrown, <minecraft:gravel>, myGreen], 
    [myGreen, myGreen, myGreen]]
);
// 设备框架
recipes.remove(<thermalexpansion:frame:64>);
recipes.addShaped(<thermalexpansion:frame:64>, 
    [[<ore:ingotTin>, <tconstruct:clear_glass>, <ore:ingotTin>], 
    [<tconstruct:clear_glass>, <forestry:impregnated_casing>, <tconstruct:clear_glass>], 
    [<ore:ingotTin>, <tconstruct:clear_glass>, <ore:ingotTin>]]
);
// 灵魂协调涂抹粉末
recipes.remove(<enderio:item_material:52>);
recipes.addShaped(<enderio:item_material:52> * 2, 
    [[<ore:dyeBrown>, <ore:dustNetherQuartz>, <ore:dyeBrown>], 
    [<ore:dustNetherQuartz>, <ore:dyeBlack>, <ore:dustNetherQuartz>], 
    [<ore:dyeBrown>, <ore:dustNetherQuartz>, <ore:dyeBrown>]]
);
// 红石接收线圈
recipes.remove(<thermalfoundation:material:513>);
recipes.addShaped(<thermalfoundation:material:513> * 2, 
    [[<ore:dustRedstone>, <ic2:crafting:13>, <ore:nuggetGold>], 
    [<ic2:crafting:13>, <ore:dustRedstone>, <ic2:crafting:13>], 
    [<ore:nuggetGold>, <ic2:crafting:13>, <ore:dustRedstone>]]
);
// 彩虹发电机
recipes.remove(<extrautils2:rainbowgenerator>);
recipes.addShaped(<extrautils2:rainbowgenerator>, 
    [[<advanced_solar_panels:machines:5>, <extrautils2:rainbowgenerator:2>, <draconicevolution:chaotic_core>], 
    [<extrautils2:compressedcobblestone:7>, <extrautils2:decorativesolid:8>, <extrautils2:ingredients:16>], 
    [<cuisine:food:16>, <extrautils2:rainbowgenerator:1>, <extrautils2:opinium:8>]]
);
// 石英
recipes.addShaped(<minecraft:quartz>, 
    [[<contenttweaker:grey_matter>, <contenttweaker:grey_matter>, <contenttweaker:grey_matter>], 
    [<contenttweaker:grey_matter>, <extrautils2:decorativesolid:2>, <contenttweaker:grey_matter>], 
    [<contenttweaker:grey_matter>, <contenttweaker:grey_matter>, <contenttweaker:grey_matter>]]
);
// 彩虹石
recipes.addShaped(<extrautils2:decorativesolid:8> * 4, 
    [[<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>], 
    [<botania:bifrostperm>, <extrautils2:decorativesolid:3>, <botania:bifrostperm>], 
    [<botania:bifrostperm>, <botania:bifrostperm>, <botania:bifrostperm>]]
);
// 粉碎机(exu2)
recipes.remove(<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}));
recipes.addShaped(<extrautils2:machine>.withTag({Type: "extrautils2:crusher"}), 
    [[<extrautils2:ingredients:17>, <tconstruct:sharpening_kit>.withTag({Material: "xu_enchanted_metal"}), <extrautils2:ingredients:17>], 
    [<extrautils2:ingredients:17>, <extrautils2:machine>, <extrautils2:ingredients:17>], 
    [<extrautils2:ingredients:17>, <tconstruct:sharpening_kit>.withTag({Material: "xu_enchanted_metal"}), <extrautils2:ingredients:17>]]
);
// 龙芯
recipes.remove(<draconicevolution:draconic_core>);
recipes.addShaped(<draconicevolution:draconic_core>, 
    [[<enderio:item_alloy_endergy_ingot:3>, <advanced_solar_panels:crafting:9>, <enderio:item_alloy_endergy_ingot:3>], 
    [<enderio:item_material:8>, <draconicevolution:draconium_block>, <enderio:item_material:71>], 
    [<tconstruct:large_plate>.withTag({Material: "cobalt"}), <botania:storage:1>, <tconstruct:large_plate>.withTag({Material: "cobalt"})]]
);
// 元始魔力粉
recipes.addShaped(<thermalfoundation:material:1028> * 4, 
    [[<thermalfoundation:material:1024>, <thermalfoundation:material:1024>, <thermalfoundation:material:1025>], 
    [<thermalfoundation:material:1024>, <enderio:item_material:38>, <thermalfoundation:material:1025>], 
    [<thermalfoundation:material:1024>, <thermalfoundation:material:1025>, <thermalfoundation:material:1025>]]
);
// 双足飞龙剑
recipes.remove(<draconicevolution:wyvern_sword>);
recipes.addShaped(<draconicevolution:wyvern_sword>, 
    [[<botania:manaresource:9>, <draconicevolution:draconic_core>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <variedcommodities:mithril_sword>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <draconicevolution:wyvern_core>, <botania:manaresource:9>]]
);
// 双足飞龙斧
recipes.remove(<draconicevolution:wyvern_axe>);
recipes.addShaped(<draconicevolution:wyvern_axe>, 
    [[<botania:manaresource:9>, <draconicevolution:draconic_core>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <botania:terraaxe>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <draconicevolution:wyvern_core>, <botania:manaresource:9>]]
);
// 双足飞龙弓
recipes.remove(<draconicevolution:wyvern_bow>);
recipes.addShaped(<draconicevolution:wyvern_bow>, 
    [[<botania:manaresource:9>, <draconicevolution:draconic_core>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <extrautils2:compoundbow>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <draconicevolution:wyvern_core>, <botania:manaresource:9>]]
);
// 双足飞龙镐
recipes.remove(<draconicevolution:wyvern_pick>);
recipes.addShaped(<draconicevolution:wyvern_pick>, 
    [[<botania:manaresource:9>, <draconicevolution:draconic_core>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <botania:glasspick>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <draconicevolution:wyvern_core>, <botania:manaresource:9>]]
);
// 双足飞龙铲
recipes.remove(<draconicevolution:wyvern_shovel>);
recipes.addShaped(<draconicevolution:wyvern_shovel>, 
    [[<botania:manaresource:9>, <draconicevolution:draconic_core>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <cuisine:iron_spatula>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <draconicevolution:wyvern_core>, <botania:manaresource:9>]]
);
// 双足飞龙头盔
recipes.remove(<draconicevolution:wyvern_helm>);
recipes.addShaped(<draconicevolution:wyvern_helm>, 
    [[<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:draconic_core>, <enderio:item_alloy_endergy_ingot:2>], 
    [<enderio:item_alloy_endergy_ingot:6>, <botania:terrasteelhelm>, <enderio:item_alloy_endergy_ingot:6>], 
    [<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:wyvern_core>, <enderio:item_alloy_endergy_ingot:2>]]
);
// 双足飞龙胸甲
recipes.remove(<draconicevolution:wyvern_chest>);
recipes.addShaped(<draconicevolution:wyvern_chest>, 
    [[<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:draconic_core>, <enderio:item_alloy_endergy_ingot:2>], 
    [<enderio:item_alloy_endergy_ingot:6>, <botania:terrasteelchest>, <enderio:item_alloy_endergy_ingot:6>], 
    [<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:wyvern_core>, <enderio:item_alloy_endergy_ingot:2>]]
);
// 双足飞龙护腿
recipes.remove(<draconicevolution:wyvern_legs>);
recipes.addShaped(<draconicevolution:wyvern_legs>, 
    [[<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:draconic_core>, <enderio:item_alloy_endergy_ingot:2>], 
    [<enderio:item_alloy_endergy_ingot:6>, <botania:terrasteellegs>, <enderio:item_alloy_endergy_ingot:6>], 
    [<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:wyvern_core>, <enderio:item_alloy_endergy_ingot:2>]]
);
// 双足飞龙靴
recipes.remove(<draconicevolution:wyvern_boots>);
recipes.addShaped(<draconicevolution:wyvern_boots>, 
    [[<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:draconic_core>, <enderio:item_alloy_endergy_ingot:2>], 
    [<enderio:item_alloy_endergy_ingot:6>, <botania:terrasteelboots>, <enderio:item_alloy_endergy_ingot:6>], 
    [<enderio:item_alloy_endergy_ingot:2>, <draconicevolution:wyvern_core>, <enderio:item_alloy_endergy_ingot:2>]]
);
