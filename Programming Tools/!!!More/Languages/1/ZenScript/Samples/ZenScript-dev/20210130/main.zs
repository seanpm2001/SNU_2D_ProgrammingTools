#priority 100

import crafttweaker.item.IItemStack as IItemStack;

val rockMaxPro = <astralsorcery:itemrockcrystalsimple>.withTag(
    {astralsorcery: {
        crystalProperties: {
            collectiveCapability: 100, size: 400, fract: 0, purity: 100, sizeOverride: -1
            }
        }
    }
);
val beefRaw = <minecraft:beef>;
val rabbitRaw = <minecraft:rabbit>;
val chickenRaw = <minecraft:chicken>;
val pigRaw = <minecraft:porkchop>;
val fishRaw = <minecraft:fish>;
val neutron = <avaritia:resource:2>;
val cosmicMeatBall = <avaritia:cosmic_meatballs>;
val ultimateStew = <avaritia:ultimate_stew>;
val pumpkin = <minecraft:pumpkin>;
val brownMushRoom = <minecraft:brown_mushroom>;
val wheat = <minecraft:wheat>;
val carrot = <minecraft:carrot>;
val beetRoot = <minecraft:beetroot>;
val apple = <minecraft:apple>;
val potato = <minecraft:potato>;
val melon = <minecraft:melon>;
val cactus = <minecraft:cactus>;

var remove = [
    <minecraft:furnace>,
    <botania:pylon:2>,
    <botania:runealtar>,
    <extendedcrafting:material>,
    <extendedcrafting:material:2>,
    <appliedenergistics2:inscriber>,
    <extendedcrafting:table_advanced>,
    <appliedenergistics2:controller>,
    <thermalexpansion:frame>,
    <enderio:item_material>,
    <ic2:resource:12>,
    <draconicevolution:wyvern_core>,
    <draconicevolution:draconic_core>,
    <astralsorcery:blockblackmarble>,
    <draconicevolution:wyvern_helm>,
    <draconicevolution:wyvern_chest>,
    <draconicevolution:wyvern_legs>,
    <draconicevolution:wyvern_boots>
] as IItemStack[];
for myRemove in remove{
    recipes.remove(myRemove);
}

// 木棍
recipes.addShaped(<minecraft:stick> * 8, [
    [<contenttweaker:wooden_shears>.anyDamage().transformDamage(20), <ore:treeSapling>] 
]);
<minecraft:stick>.addTooltip("查看合成表有惊喜");

// 简易剪枝器
recipes.addShaped(<contenttweaker:wooden_shears>, [
    [<minecraft:flint>, <ore:logWood>], 
    [<ore:logWood>, null]
]);

// 自然木
recipes.addShaped(<contenttweaker:magic_log> * 8, [
    [<ore:logWood>, <ore:logWood>, <ore:logWood>], 
    [<ore:logWood>, <ore:dye>, <ore:logWood>], 
    [<ore:logWood>, <ore:logWood>, <ore:logWood>]
]);

// 熔炉模型
recipes.addShaped(<contenttweaker:clay_furnace>, [
    [<ore:itemClay>, <ore:itemClay>, <ore:itemClay>], 
    [<ore:itemClay>, <minecraft:flint>, <ore:itemClay>], 
    [<ore:itemClay>, <ore:itemClay>, <ore:itemClay>]
]);

// 熔炉
recipes.addShaped(<minecraft:furnace>, [
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>], 
    [<ore:cobblestone>, <contenttweaker:clay_furnace>, <ore:cobblestone>], 
    [<ore:cobblestone>, <ore:cobblestone>, <ore:cobblestone>]
]);

// 标定框架
recipes.addShaped(<forestry:frame_proven>, [
    [<forestry:honeydew>, <forestry:honeydew>, <forestry:honeydew>],
    [<harvestcraft:pammaple>, <forestry:bee_combs_0>, <harvestcraft:pammaple>],
    [<harvestcraft:pammaple>, <harvestcraft:pammaple>, <harvestcraft:pammaple>]
]);

// 盖亚水晶
recipes.addShaped(<botania:pylon:2>, [
    [<botania:manaresource:4>, <botania:manaresource:8>, <botania:manaresource:4>], 
    [<botania:manaresource:9>, <botania:pylon>, <botania:manaresource:9>], 
    [<botania:manaresource:4>, <botania:manaresource:9>,<botania:manaresource:4> ]
]);

// 魔力符文
mods.inworldcrafting.FluidToItem.transform(
    <botania:rune:8>, 
    <liquid:water>, 
    [<botania:manaresource>, <botania:manaresource:1>, <botania:manaresource:2>], 
    false
);

// 符文祭坛
recipes.addShaped(<botania:runealtar>, [
    [<botania:rune:8>, <botania:rune:8>, <botania:rune:8>], 
    [<botania:livingrock:1>, <super_solar_panels:crafting:12>, <botania:livingrock:1>],
    [<botania:livingrock:1>, <contenttweaker:magic_log>, <botania:livingrock:1>]
]);

// 海晶碎片
mods.immersiveengineering.BlastFurnace.addRecipe(
    <minecraft:prismarine_shard>, <ore:gemQuartz>, 2000, <minecraft:prismarine_crystals>
);

// 黑铁
recipes.addShaped(<extendedcrafting:material> * 8, [
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
    [<ore:ingotIron>, <ore:dyeBlack>, <ore:ingotIron>],
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]
]);

// 黑铁板
recipes.addShaped(<extendedcrafting:material:2>, [
    [<contenttweaker:hammer>.anyDamage().transformDamage(10), <extendedcrafting:material>]
]);

// 锤子
recipes.addShaped(<contenttweaker:hammer>, [
    [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
    [<ore:blockIron>, <ore:stickWood>, null],
    [null, null, <ore:stickWood>]
]);

// 压印机
mods.extendedcrafting.TableCrafting.addShaped(0, <appliedenergistics2:inscriber>, [
    [<ore:ingotConstructionAlloy>, <minecraft:sticky_piston>, <ore:ingotConstructionAlloy>], 
    [<ore:crystalFluix>, <ore:nuggetTerrasteel>, <ore:ingotConstructionAlloy>], 
    [<ore:ingotConstructionAlloy>, <minecraft:sticky_piston>, <ore:ingotConstructionAlloy>]
]);

// 万用处理器蓝图
mods.immersiveengineering.Blueprint.addRecipe
("Banana Pancakes", <contenttweaker:processor>, 
[<appliedenergistics2:material:24>, <appliedenergistics2:material:23>, <appliedenergistics2:material:22>]
);

// me控制器
mods.extendedcrafting.TableCrafting.addShaped(0, <appliedenergistics2:controller>, [
    [<ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>], 
    [<ic2:casing:5>, <ore:circuitAdvanced>, <immersiveengineering:metal_decoration0>, <ore:circuitAdvanced>, <ic2:casing:5>], 
    [<ic2:casing:5>, <immersiveengineering:metal_decoration0>, <contenttweaker:processor>, <immersiveengineering:metal_decoration0>, <ic2:casing:5>], 
    [<ic2:casing:5>, <ore:circuitAdvanced>, <immersiveengineering:metal_decoration0>, <ore:circuitAdvanced>, <ic2:casing:5>], 
    [<ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>, <ic2:casing:5>]
]);

// 高级工作台
recipes.addShaped(<extendedcrafting:table_advanced>, [
    [<appliedenergistics2:material:35>, <appliedenergistics2:material:35>, <appliedenergistics2:material:35>],
    [<appliedenergistics2:material:35>, <extendedcrafting:table_basic>, <appliedenergistics2:material:35>],
    [<appliedenergistics2:material:35>, <appliedenergistics2:material:35>, <appliedenergistics2:material:35>]
]);

// 基础机器方块
recipes.addShaped(<ic2:resource:12>, [
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], 
    [<ore:plateIron>, <contenttweaker:hammer>.anyDamage().transformDamage(20), <ore:plateIron>], 
    [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]
]);

// 机器框架
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:frame>, [
	[<ore:scaffoldingSteel>, <ore:fusedQuartz>, <ore:scaffoldingSteel>], 
	[<ore:fusedQuartz>, <ic2:resource:13>, <ore:fusedQuartz>], 
	[<ore:scaffoldingSteel>, <ore:fusedQuartz>, <ore:scaffoldingSteel>]
]);

// 机器框架模具
recipes.addShaped(<enderio:item_material>, [
    [<ic2:fence>, <enderio:item_material:20>, <ic2:fence>],
    [<enderio:item_material:20>, <ic2:resource:12>, <enderio:item_material:20>],
    [<ic2:fence>, <enderio:item_material:20>, <ic2:fence>]
]);

// 双足飞龙嬗变器
mods.extendedcrafting.TableCrafting.addShaped(0, <contenttweaker:dragon> * 4, [
    [null, null, null, <draconicevolution:infused_obsidian>, null, null, null], 
    [null, null, <ore:ingotDraconium>, <contenttweaker:processor>, <ore:ingotDraconium>, null, null], 
    [null, <ore:ingotEnderium>, <contenttweaker:processor>, <appliedenergistics2:material:6>, <contenttweaker:processor>, <ore:ingotEnderium>, null], 
    [<draconicevolution:infused_obsidian>, <ore:ingotDraconium>, <ore:dropRoyalJelly>, <ore:blockCrystaltine>, <ore:dropRoyalJelly>, <ore:ingotDraconium>, <draconicevolution:infused_obsidian>], 
    [null, <ore:ingotEnderium>, <contenttweaker:processor>, <appliedenergistics2:material:6>, <contenttweaker:processor>, <ore:ingotEnderium>, null], 
    [null, null, <ore:ingotDraconium>, <contenttweaker:processor>, <ore:ingotDraconium>, null, null], 
    [null, null, null, <draconicevolution:infused_obsidian>, null, null, null]
]);

// 双足飞龙核心
mods.extendedcrafting.TableCrafting.addShaped(0, <draconicevolution:wyvern_core>, [
    [<ore:ingotDraconium>, <ore:ingotDraconium>, null, <ore:ingotTerrasteel>, null, <ore:ingotDraconium>, <ore:ingotDraconium>], 
    [<ore:ingotDraconium>, <ore:gemDiamond>, <ore:ingotDraconium>, <ore:runePrideB>, <ore:ingotDraconium>, <ore:gemDiamond>, <ore:ingotDraconium>], 
    [null, <ore:ingotDraconium>, <ore:nuggetCosmicNeutronium>, <ore:runeWrathB>, <ore:nuggetCosmicNeutronium>, <ore:ingotDraconium>, null], 
    [<ore:ingotTerrasteel>, <ore:runeLustB>, <contenttweaker:dragon>, <extendedcrafting:material:40>, <contenttweaker:dragon>, <ore:runeSlothB>, <ore:ingotTerrasteel>], 
    [null, <ore:ingotDraconium>, <ore:nuggetCosmicNeutronium>, <ore:runeGreedB>, <ore:nuggetCosmicNeutronium>, <ore:ingotDraconium>, null], 
    [<ore:ingotDraconium>, <ore:gemDiamond>, <ore:ingotDraconium>, <ore:runeEnvyB>, <ore:ingotDraconium>, <ore:gemDiamond>, <ore:ingotDraconium>], 
    [<ore:ingotDraconium>, <ore:ingotDraconium>, null, <ore:ingotTerrasteel>, null, <ore:ingotDraconium>, <ore:ingotDraconium>]
]);

// 龙芯
recipes.addShaped(<draconicevolution:draconic_core> * 2, [
    [<draconicevolution:draconium_ingot>, <super_solar_panels:crafting:4>, <draconicevolution:draconium_ingot>], 
    [<super_solar_panels:crafting:4>, <avaritia:resource>, <super_solar_panels:crafting:4>], 
    [<draconicevolution:draconium_ingot>, <super_solar_panels:crafting:4>, <draconicevolution:draconium_ingot>]
]);

// 双足飞龙能量核心
mods.extendedcrafting.TableCrafting.addShaped(0, <draconicevolution:wyvern_energy_core>, [
    [<ore:nuggetCrystaltine>, null, <ore:ingotDraconium>, null, <ore:nuggetCrystaltine>], 
    [null, <ore:blockRedstoneAlloy>, <immersiveengineering:metal_decoration0:3>, <ore:blockRedstoneAlloy>, null], 
    [<ore:ingotDraconium>, <contenttweaker:processor>, <contenttweaker:dragon>, <contenttweaker:processor>, <ore:ingotDraconium>], 
    [null, <ore:blockRedstoneAlloy>, <immersiveengineering:metal_device1:8>, <ore:blockRedstoneAlloy>, null], 
    [<ore:nuggetCrystaltine>, null, <ore:ingotDraconium>, null, <ore:nuggetCrystaltine>]
]);

// 双足飞龙套
// 依次 头甲腿靴
mods.extendedcrafting.CombinationCrafting.addRecipe(
    <draconicevolution:wyvern_helm>, 
    10000000, 
    500, 
    <contenttweaker:skull_block>, 
    [<contenttweaker:processor>, 
    <contenttweaker:dragon>, 
    <extendedcrafting:material:40>, 
    <forestry:ash>, 
    <thermalfoundation:rockwool:5>, 
    <avaritia:resource:4>, 
    <draconicevolution:draconic_core>, 
    <draconicevolution:wyvern_core>, 
    <draconicevolution:wyvern_energy_core>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(
    <draconicevolution:wyvern_chest>, 
    10000000, 
    500, 
    <botania:terrasteelchest>, 
    [<contenttweaker:processor>, 
    <contenttweaker:dragon>, 
    <extendedcrafting:material:40>, 
    <forestry:ash>, 
    <thermalfoundation:rockwool:5>, 
    <avaritia:resource:4>, 
    <draconicevolution:draconic_core>, 
    <draconicevolution:wyvern_core>, 
    <draconicevolution:wyvern_energy_core>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(
    <draconicevolution:wyvern_legs>, 
    10000000, 
    500, 
    <botania:terrasteellegs>, 
    [<contenttweaker:processor>, 
    <contenttweaker:dragon>, 
    <extendedcrafting:material:40>, 
    <forestry:ash>, 
    <thermalfoundation:rockwool:5>, 
    <avaritia:resource:4>, 
    <draconicevolution:draconic_core>, 
    <draconicevolution:wyvern_core>, 
    <draconicevolution:wyvern_energy_core>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(
    <draconicevolution:wyvern_boots>, 
    10000000, 
    500, 
    <botania:terrasteelboots>, 
    [<contenttweaker:processor>, 
    <contenttweaker:dragon>, 
    <extendedcrafting:material:40>, 
    <forestry:ash>, 
    <thermalfoundation:rockwool:5>, 
    <avaritia:resource:4>, 
    <draconicevolution:draconic_core>, 
    <draconicevolution:wyvern_core>, 
    <draconicevolution:wyvern_energy_core>]);
    
// 熏黑大理石
mods.extendedcrafting.TableCrafting.addShaped(0, <astralsorcery:blockblackmarble> * 16, [
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:coal>, <ore:stoneMarble>, <ore:stoneMarble>], 
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:coal>, <ore:stoneMarble>, <ore:stoneMarble>], 
    [<ore:coal>, <ore:coal>, <ore:coal>, <ore:coal>, <ore:coal>], 
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:coal>, <ore:stoneMarble>, <ore:stoneMarble>], 
    [<ore:stoneMarble>, <ore:stoneMarble>, <ore:coal>, <ore:stoneMarble>, <ore:stoneMarble>]
]);

// 大理石
mods.thermalexpansion.Transposer.addFillRecipe(
    <astralsorcery:blockmarble>, <contenttweaker:magic_stone>, <liquid:water> * 250, 1000);
mods.thermalexpansion.Transposer.addFillRecipe(
    <astralsorcery:blockmarble>, <contenttweaker:calcium_carbonate_dust> * 4, <liquid:water> * 250, 1000);

<torchmaster:feral_flare_lantern>.addTooltip(format.red("可能会使附近的效应放大器失效，因为效应放大器需要足够的空间。"));

// 蓝图
recipes.addShaped(<immersiveengineering:blueprint>.withTag({blueprint: "Banana Pancakes"}), [
    [<ore:plateLapis>, <ore:plateLapis>, <ore:plateLapis>],
    [<appliedenergistics2:material:1>, <enderio:item_material:77>, <appliedenergistics2:material:1>],
    [<ore:plateLapis>, <ore:plateLapis>, <ore:plateLapis>]
]);

// 水晶石
recipes.addShaped(rockMaxPro, [
    [<astralsorcery:blockinfusedwood>, <astralsorcery:blockinfusedwood>, <astralsorcery:blockinfusedwood>],
    [<astralsorcery:blockinfusedwood>, <astralsorcery:itemcraftingcomponent>, <astralsorcery:blockinfusedwood>],
    [<astralsorcery:blockinfusedwood>, <astralsorcery:blockinfusedwood>, <astralsorcery:blockinfusedwood>]
]);

// 寰宇肉丸
recipes.addShapeless(cosmicMeatBall,[neutron, chickenRaw, fishRaw, pigRaw, rabbitRaw, beefRaw]);

// 超级煲
recipes.addShaped(ultimateStew*9,[[pumpkin, brownMushRoom, wheat],[beetRoot, neutron, apple,],[potato, melon, cactus]]);

