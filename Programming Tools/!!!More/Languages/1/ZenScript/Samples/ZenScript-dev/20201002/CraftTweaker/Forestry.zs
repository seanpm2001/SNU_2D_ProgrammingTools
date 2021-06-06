import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

var ban as IItemStack[] = [
    <forestry:sturdy_machine>
];

for item in ban {
    recipes.remove(item);
}

val recipeIngredient as IIngredient[][][IItemStack] = {
    <forestry:fabricator> : [
        [<ore:ingotGold>, <ore:blockGlass>, <ore:ingotGold>],
        [<ore:blockGlass>, <forestry:sturdy_machine>, <ore:blockGlass>],
        [<ore:ingotGold>, <forestry:worktable>, <ore:ingotGold>]
    ]
};

for out, inputs in recipeIngredient {
    Lib.recipeTweak(true, out, inputs);
}

// 坚固部件
Lib.addAssemblyTableRecipe(<forestry:sturdy_machine>, 500, [<ore:ingotBronze> * 8]);