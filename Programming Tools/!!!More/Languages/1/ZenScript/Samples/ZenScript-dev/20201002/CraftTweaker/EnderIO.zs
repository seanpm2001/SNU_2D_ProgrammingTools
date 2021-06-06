import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

val recipeIngredient as IIngredient[][][IItemStack] = {
    <enderio:item_material> : [
        [<ore:ingotIron>|<enderio:item_alloy_ingot:9>, <enderio:item_material:20>, <ore:ingotIron>|<enderio:item_alloy_ingot:9>],
        [<enderio:item_material:20>, <ic2:resource:12>, <enderio:item_material:20>],
        [<ore:ingotIron>|<enderio:item_alloy_ingot:9>, <enderio:item_material:20>, <ore:ingotIron>|<enderio:item_alloy_ingot:9>]
    ],

    <enderio:block_simple_alloy_smelter> : [
        [<ore:ingotIron>|<enderio:item_alloy_ingot:9>, <ore:ingotIron>|<enderio:item_alloy_ingot:9>, <ore:ingotIron>|<enderio:item_alloy_ingot:9>],
        [<minecraft:furnace>, <enderio:item_material>, <minecraft:furnace>],
        [<ore:gearStone>, <tconstruct:pan_head>.withTag({Material: "bronze"}), <ore:gearStone>]
    ]
};



for out, inputs in recipeIngredient {
    Lib.recipeTweak(true, out, inputs);
}
