import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

var ban as string[] = [
    "buildcraftsilicon:redstone_chipset",
    "buildcraftsilicon:iron_chipset",
    "buildcraftsilicon:gold_chipset",
    "buildcraftsilicon:quartz_chipset",
    "buildcraftsilicon:diamond_chipset"
];

for recipeName in ban {
    mods.buildcraft.AssemblyTable.removeByName(recipeName);
}

val recipeIngredient as IIngredient[][][IItemStack] = {
    <buildcraftcore:engine:1> : [
        [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>],
        [null, <ore:blockGlassColorless>, null],
        [<ore:gearStone>, <buildcraftcore:engine>, <ore:gearStone>]
    ],

    <buildcraftsilicon:laser> : [
        [<ore:dustRedstone>, <ore:dustRedstone>, <ore:dustRedstone>],
        [<ore:ingotGold>, <ore:gemDiamond>, <ore:ingotGold>],
        [<ore:stone>, <ore:ingotIron>, <ore:stone>]
    ],

    <buildcraftsilicon:assembly_table> : [
        [<ore:stone>,<ore:gemDiamond>,<ore:stone>],
        [<ore:stone>,<ore:dustRedstone>,<ore:stone>],
        [<ore:stone>,<ore:gearDiamond>,<ore:stone>]
    ]
};

for out, inputs in recipeIngredient {
    Lib.recipeTweak(true, out, inputs);
}

var material as IIngredient[] = [
    <ore:dustRedstone>,
    <ore:ingotIron>,
    <ore:ingotGold>,
    <ore:gemQuartz>,
    <ore:gemDiamond>
];

var chipset as IItemStack[] = [
    <buildcraftsilicon:redstone_chipset>,
    <buildcraftsilicon:redstone_chipset:1>,
    <buildcraftsilicon:redstone_chipset:2>,
    <buildcraftsilicon:redstone_chipset:3>,
    <buildcraftsilicon:redstone_chipset:4>
];

var power as int[] = [1000, 2000, 4000, 6000, 8000];

for i, input in material {
    var out as IItemStack = chipset[i];
    var needPower as int = power[i];
    if(i == 0) {
        Lib.addAssemblyTableRecipe(out, needPower, [input]);
    } else {
        Lib.addAssemblyTableRecipe(out, needPower, [input, chipset[0]]);
    }
}
