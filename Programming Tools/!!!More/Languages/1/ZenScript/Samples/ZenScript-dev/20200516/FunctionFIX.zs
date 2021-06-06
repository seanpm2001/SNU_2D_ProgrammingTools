import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;
import mods.thermalexpansion.Transposer;
import mods.thermalexpansion.Crucible;
import mods.thermalexpansion.InductionSmelter;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IWorld;
import mods.thermalexpansion.Infuser;

recipes.remove(<thermalexpansion:augment:401>);
recipes.addShaped("Repair", <thermalexpansion:augment:401>, [
    [<enderio:item_material:69>, <enderio:item_xp_transfer>.marked("meta"), <enderio:item_material:69>], 
    [<immersiveengineering:material:27>, <thermalfoundation:diagram_redprint>.marked("xpe"), <ore:plateBronze>], 
    [<enderio:item_material:69>, <minecraft:enchanted_book>.marked("xp"), <enderio:item_material:69>]
], 
function(out, ins, cInfo) {
    var xTransfer = ins.meta.displayName;
    var xpTransfer = ins.xpe.displayName;
    var xMeta = ins.xp.displayName;
    var finalN = xTransfer + xpTransfer;
    if (finalN has ":") {
        if (xMeta == "null") {
            return itemUtils.getItem(finalN);
        }
        return itemUtils.getItem(finalN, xMeta);
    }
    return <thermalexpansion:augment:401>;
}, null);


mods.thaumcraft.ArcaneWorkbench.removeRecipe(<thaumcraft:arcane_workbench_charger>);
recipes.addShaped("arcane_workbench_charger", <thaumcraft:arcane_workbench_charger>, [
    [null, <ore:itemWirelessDish>, null], 
    [<thaumcraft:mirrored_glass>, <appliedenergistics2:material:42>, <thaumcraft:mirrored_glass>], 
    [<thermalfoundation:material:656>, <ore:nitor>, <thermalfoundation:material:656>]
]);


recipes.addShaped("pigSoul", <draconicevolution:mob_soul>.withTag({}), [
    [null, <ore:listAllmeatraw>, null], 
    [<ore:listAllmeatraw>, <minecraft:spider_eye>, <ore:listAllmeatraw>], 
    [null, <ore:listAllmeatraw>, null]
]);


recipes.addShaped("", <cuisine:crops>, [
    [<ore:seedWheat>, <ore:seedWheat>, null], 
    [null, null, null], 
    [null, null, null]
]);
recipes.addShaped("0", <cuisine:crops:1>, [
    [<ore:seedWheat>, null, <ore:seedWheat>], 
    [null, null, null], 
    [null, null, null]
]);
recipes.addShaped("2", <cuisine:crops:2>, [
    [<ore:seedWheat>, null, null], 
    [<ore:seedWheat>, null, null], 
    [null, null, null]
]);
recipes.addShaped("3", <cuisine:crops:3>, [
    [<ore:seedWheat>, null, null], 
    [null, <ore:seedWheat>, null], 
    [null, null, null]
]);
recipes.addShaped("4", <cuisine:crops:4>, [
    [<ore:seedWheat>, null, null], 
    [null, null, <ore:seedWheat>], 
    [null, null, null]
]);
recipes.addShaped("5", <cuisine:crops:5>, [
    [<ore:seedWheat>, null, null], 
    [null, null, null], 
    [<ore:seedWheat>, null, null]
]);
recipes.addShaped("6", <cuisine:crops:6>, [
    [<ore:seedWheat>, null, null], 
    [null, null, null], 
    [null, <ore:seedWheat>, null]
]);
recipes.addShaped("9", <cuisine:crops:9>, [
    [<ore:seedWheat>, null, null], 
    [null, null, null], 
    [null, null, <ore:seedWheat>]
]);
recipes.addShaped("10", <cuisine:crops:10>, [
    [null, <ore:seedWheat>, <ore:seedWheat>], 
    [null, null, null], 
    [null, null, null]
]);
recipes.addShaped("11", <cuisine:crops:11>, [
    [null, <ore:seedWheat>, null], 
    [<ore:seedWheat>, null, null], 
    [null, null, null]
]);
recipes.addShaped("12", <cuisine:crops:12>, [
    [null, <ore:seedWheat>, null], 
    [null, <ore:seedWheat>, null], 
    [null, null, null]
]);
recipes.addShaped("13", <cuisine:crops:13>, [
    [null, <ore:seedWheat>, null], 
    [null, null, null], 
    [<ore:seedWheat>, null, null]
]);
recipes.addShaped("14", <cuisine:crops:14>, [
    [null, <ore:seedWheat>, null], 
    [null, null, null], 
    [null, <ore:seedWheat>, null]
]);
recipes.addShaped("15", <cuisine:crops:15>, [
    [null, <ore:seedWheat>, null], 
    [null, null, null], 
    [null, null, <ore:seedWheat>]
]);
recipes.addShaped("16", <cuisine:crops:16>, [
    [null, null, <ore:seedWheat>], 
    [<ore:seedWheat>, null, null], 
    [null, null, null]
]);
recipes.addShaped("17", <cuisine:crops:17>, [
    [null, null, <ore:seedWheat>], 
    [null, <ore:seedWheat>, null], 
    [null, null, null]
]);
recipes.addShaped("18", <cuisine:crops:18>, [
    [null, null, <ore:seedWheat>], 
    [null, null, <ore:seedWheat>], 
    [null, null, null]
]);
recipes.addShaped("19", <cuisine:crops:19>, [
    [null, null, <ore:seedWheat>], 
    [null, null, null], 
    [<ore:seedWheat>, null, null]
]);
recipes.addShaped("20", <cuisine:crops:20>, [
    [null, null, <ore:seedWheat>], 
    [null, null, null], 
    [null, <ore:seedWheat>, null]
]);
recipes.addShaped("21", <cuisine:crops:21>, [
    [null, null, <ore:seedWheat>], 
    [null, null, null], 
    [null, null, <ore:seedWheat>]
]);
recipes.addShaped("bamboo", <cuisine:bamboo>*32, [
    [<ore:logWood>, null, null], 
    [null, <ore:logWood>, null], 
    [null, null, null]
]);
recipes.addShaped("4", <cuisine:food:4>, [
    [null, <ore:seedWheat>, null], 
    [null, null, <ore:seedWheat>], 
    [null, null, null]
]);


recipes.addShaped("lighter", <variedcommodities:lighter>, [
    [null, null, <sakura:kitunebi>], 
    [null, <minecraft:fire_charge>, null], 
    [<cuisine:fan>, null, null]
]);


recipes.addShaped("ring", <baubles:ring>, [
    [null, <ore:ingotElectricalSteel>, null], 
    [<advanced_solar_panels:crafting:3>, <minecraft:enchanted_book>.withTag({StoredEnchantments: [{lvl: 5 as short, id: 32 as short}]}), <ore:ingotElectrum>], 
    [null, <advanced_solar_panels:crafting:3>, null]
]);


recipes.remove(<enderio:item_material>);
recipes.addShaped("enderio_material", <enderio:item_material>, [
    [<ore:plateThaumium>, <minecraft:iron_trapdoor>, <ore:plateThaumium>], 
    [<advanced_solar_panels:crafting:6>, <enderio:item_basic_capacitor>, <appliedenergistics2:material:25>], 
    [<ore:plateThaumium>, <minecraft:iron_trapdoor>, <ore:plateThaumium>]
]);


recipes.addShapeless("NO2", <immersiveengineering:material:24>, [<thaumadditions:salt_essence>]);


recipes.remove(<modularmachinery:itemmodularium>);
mods.immersiveengineering.ArcFurnace.addRecipe(<modularmachinery:itemmodularium>, <ore:ingotGold>, <thermalfoundation:material:161>, 200, 40, [<ore:ingotIron>, <minecraft:redstone>*2, <minecraft:glowstone_dust>], "Alloying");


recipes.remove(<thermalexpansion:device:10>);
recipes.addShaped("unpack", <thermalexpansion:device:10>, [
    [<ore:crystalLitherite>, <immersiveengineering:mold:7>, <ore:crystalLitherite>], 
    [<ore:workbench>, <thermalexpansion:frame:64>, <ore:workbench>], 
    [<ore:crystalLitherite>, <immersiveengineering:stone_decoration:7>, <ore:crystalLitherite>]
]);

recipes.addShaped(<sakura:foodset:69>, [
    [null, <ore:bread>, null], 
    [<ore:listAllgrain>, <ore:cropLemon>, <cuisine:material:4>], 
    [null, <ore:bread>, null]
]);


var wyverns = [<draconicevolution:wyvern_axe>,<draconicevolution:wyvern_bow>,<draconicevolution:wyvern_pick>,<draconicevolution:wyvern_shovel>,<draconicevolution:wyvern_sword>,<draconicevolution:wyvern_helm>,<draconicevolution:wyvern_chest>,<draconicevolution:wyvern_legs>,<draconicevolution:wyvern_boots>] as IItemStack[];
for i, wyvern in wyverns {    
    var wyvern = wyverns[i];
    recipes.remove(wyvern);
}


recipes.removeByRegex("thaumcraft:.*plate");
recipes.remove(<extracells:walrus>);

mods.thermalexpansion.Crucible.addRecipe(<liquid:mana> * 250,<thermalfoundation:geode>,100000);
mods.thermalexpansion.Transposer.addFillRecipe(<thermalfoundation:storage:8> , <thermalfoundation:storage:2> , <liquid:mana> * 9000,120000);
mods.thermalexpansion.Transposer.addFillRecipe(<extracells:walrus> , <thermalfoundation:storage:8> , <liquid:ic2uu_matter> * 1000,120000);
recipes.addShaped("geode", <thermalfoundation:geode>, [
    [null, <appliedenergistics2:material:1>, null], 
    [<thaumcraft:alumentum>, <thaumadditions:crystal_block>.withTag({Aspect: "caeles"}), <thaumcraft:alumentum>], 
    [null, <forge:bucketfilled>.withTag({FluidName: "crystal_water", Amount: 1000}), null]
]);
mods.thermalexpansion.Crucible.addRecipe(<liquid:ic2uu_matter> * 250,<ic2:misc_resource:3>,100);
recipes.addShaped("UU_mater", <ic2:misc_resource:3>, [
    [null, <sakura:foodset:42>, null], 
    [<ore:itemBiomassRich>, <ore:netherStar>, <ore:itemBiomass>], 
    [null, <appliedenergistics2:paint_ball:30>, null]
]);
mods.avaritia.ExtremeCrafting.addShaped("Overletter", <custommc:item705>.withTag({ench: [{lvl: 1 as short, id: 10 as short}, {lvl: 3 as short, id: 36 as short}, {lvl: 3 as short, id: 27 as short}], RepairCost: 7}), [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,<extracells:walrus>, <ore:blockDraconiumAwakened>, <ic2:nuclear:3>, <ore:blockDraconiumAwakened>, <extracells:walrus>,null,null], 
    [null,null,<ore:blockDraconiumAwakened>, <cuisine:food:16>, <avaritia:resource:5>, <cuisine:food:16>, <ore:blockDraconiumAwakened>,null,null], 
    [null,null,<ore:skullSentientEnder>, <enderio:item_basic_capacitor:2>, <draconicevolution:draconic_staff_of_power>, <enderio:item_basic_capacitor:2>, <ore:skullSentientEnder>,null,null], 
    [null,null,<ore:blockDraconiumAwakened>, <ore:dropRoyalJelly>, <extracells:storage.component:3>, <ore:dropRoyalJelly>, <ore:blockDraconiumAwakened>,null,null], 
    [null,null,<extracells:walrus>, <ore:blockDraconiumAwakened>, <draconicevolution:chaotic_core>, <ore:blockDraconiumAwakened>, <extracells:walrus>,null,null],
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null]
]);

<custommc:item705>.displayName = "§6§lWelcome  -look forward";
<custommc:item705>.addTooltip("§7Mr.???:我就说他会到达这里的");
<custommc:item705>.addTooltip("§7Mr.?????:嘘~");
<custommc:item705>.addTooltip("§7Mr.?????:他能听见我们说话……");
mods.avaritia.ExtremeCrafting.addShaped("smallest_haos_shard", <draconicevolution:chaos_shard:3>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, null, null, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>,null], 
    [null,null, null, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <appliedenergistics2:material:6>, <ore:oreCrystalEntropy>,null], 
    [null,null, <ore:oreCrystalEntropy>, <appliedenergistics2:material:47>, <appliedenergistics2:material:6>, <appliedenergistics2:material:6>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>,null], 
    [null,null, <ore:oreCrystalEntropy>, <appliedenergistics2:material:6>, <thaumcraft:causality_collapser>, <appliedenergistics2:material:6>, <ore:oreCrystalEntropy>, null,null], 
    [null,<ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <appliedenergistics2:material:6>, <appliedenergistics2:material:6>, <appliedenergistics2:material:47>, <ore:oreCrystalEntropy>, null,null], 
    [null,<ore:oreCrystalEntropy>, <appliedenergistics2:material:6>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, null, null,null], 
    [null,<ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, <ore:oreCrystalEntropy>, null, null, null, null],
    [null,null,null,null,null,null,null,null,null]
]);

<cuisine:food:16>.displayName = "§6充能柚子";
mods.thermalexpansion.Infuser.addRecipe(<cuisine:food:16>, <cuisine:food:10>, 10000);

recipes.addShaped("Sentient", <enderio:item_material:44>, [
    [<ore:itemEnderCrystalPowder>, <ore:itemEnderCrystalPowder>, <ore:itemEnderCrystalPowder>], 
    [<ore:itemEnderCrystalPowder>, <ore:skullEnderResonator>, <ore:itemEnderCrystalPowder>], 
    [<ore:itemEnderCrystalPowder>, <ore:itemEnderCrystalPowder>, <ore:itemEnderCrystalPowder>]
]);

recipes.addShaped("thermalcell", <environmentaltech:thermal_cell>, [
    [null, <minecraft:magma_cream>, null], 
    [<minecraft:magma_cream>, <environmentaltech:modifier_null>, <minecraft:magma_cream>], 
    [null, <minecraft:magma_cream>, null]
]);

recipes.addShaped("endercrystal", <enderio:item_material:16>, [
    [null, <appliedenergistics2:material:1>, null], 
    [<ore:itemVibrantPowder>, <ore:listAllfruit>, <ore:itemVibrantPowder>], 
    [null, <ore:itemVibrantPowder>, null]
]);
