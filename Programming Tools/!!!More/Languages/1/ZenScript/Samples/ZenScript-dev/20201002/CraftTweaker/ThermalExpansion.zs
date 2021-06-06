import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.thermalexpansion.Transposer;

val recipeIngredient as IIngredient[][][IItemStack] = {
    <thermalexpansion:frame> : [
        [<ore:ingotConductiveIron>, <ic2:crafting:3>, <ore:ingotConductiveIron>],
        [<forestry:hardened_machine>, <ic2:resource:13>, <forestry:hardened_machine>],
        [<ore:ingotConductiveIron>, <ic2:crafting:3>, <ore:ingotConductiveIron>]
    ]
};

for out, inputs in recipeIngredient {
    Lib.recipeTweak(true, out, inputs);
}

mods.thermalexpansion.Transposer.addFillRecipe(<variedcommodities:ingot_mithril>, <thermalfoundation:material:1028>, <liquid:silver> * 1000, 3000);
mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_alloy_endergy_ingot:6>, <enderio:item_alloy_endergy_ingot:3>, <botania:manaresource:4>, 2000);
mods.thermalexpansion.InductionSmelter.addRecipe(<enderio:item_alloy_endergy_ingot:2>, <enderio:item_alloy_endergy_ingot:3>, <draconicevolution:draconium_ingot>, 2000);
