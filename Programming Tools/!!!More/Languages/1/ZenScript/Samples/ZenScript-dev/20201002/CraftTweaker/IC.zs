import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.data.IData;

var ban as IItemStack[] = [
    <ic2:crafting:1>,
    <ic2:te:10>,
    <ic2:te:11>
];

for item in ban {
    recipes.remove(item);
}

//绝缘铜质导线
var copperCable as IItemStack = <ic2:cable>.withTag({type: 0 as byte, insulation: 1 as byte});

val recipeIngredient as IIngredient[][][IItemStack] = {
    <ic2:te:3> : [
        [<ore:ingotIron>, <ore:reBattery>, <ore:ingotIron>],
        [<ore:ingotIron>, <ic2:resource:12>, <ore:ingotIron>],
        [<ore:ingotIron>, <buildcraftcore:engine:1>, <ore:ingotIron>]
    ],

    <ic2:resource:12> : [
        [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>],
        [<ore:plateIron>, <forestry:sturdy_machine>, <ore:plateIron>],
        [<ore:plateIron>, <ore:plateIron>, <ore:plateIron>]
    ]
};

for out, inputs in recipeIngredient {
    Lib.recipeTweak(true, out, inputs);
}

recipes.addShaped("ic_te_10", <ic2:te:10>, 
    [[<ore:stickWood>,<ore:plankWood>,<ore:stickWood>],
    [<ore:plankWood>,<ic2:te:3>,<ore:plankWood>],
    [<ore:stickWood>,<ore:plankWood>,<ore:stickWood>]],
    function(out, ins, info) {
        var iData as IData = {te_10_recipe_time : 0};
        iData += info.player.data;
        return iData.te_10_recipe_time.asInt() < 3 && iData.te_10_recipe_time.asInt() >= 0 ? out : null;
    },
    function (out, info, player) {
        var iData as IData = {te_10_recipe_time : 0};
        iData += player.data;
        player.update({te_10_recipe_time : iData.te_10_recipe_time.asInt() + 1});
    }
);

recipes.addShaped("ic_te_11", <ic2:te:11>, 
    [[<ore:ingotIron>, null, <ore:ingotIron>],
    [null, <ic2:te:3>, null],
    [<ore:ingotIron>, null, <ore:ingotIron>]],
    function(out, ins, info) {
        var iData as IData = {te_11_recipe_time : 0};
        iData += info.player.data;
        return iData.te_11_recipe_time.asInt() < 3 && iData.te_11_recipe_time.asInt() >= 0 ? out : null;
    },
    function (out, info, player) {
        var iData as IData = {te_11_recipe_time : 0};
        iData += player.data;
        player.update({te_11_recipe_time : iData.te_11_recipe_time.asInt() + 1});
    }
);

// 电路板
Lib.addAssemblyTableRecipe(<ic2:crafting:1>, 2000, [<buildcraftsilicon:redstone_chipset:2>, <buildcraftsilicon:redstone_chipset>, <ore:plateIron>, copperCable * 6]);