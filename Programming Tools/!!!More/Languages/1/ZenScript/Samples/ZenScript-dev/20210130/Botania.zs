mods.botania.PureDaisy.removeRecipe(<botania:livingrock>);
mods.botania.PureDaisy.removeRecipe(<botania:livingwood>);

val manaBucket = <forge:bucketfilled>.withTag({FluidName: "fluidedmana", Amount: 1000});

mods.botania.PureDaisy.addRecipe(
    <contenttweaker:magic_log>, <botania:livingwood>
);
mods.botania.PureDaisy.addRecipe(
    <minecraft:stonebrick>, <botania:livingrock>
);

// 注魔石
mods.botania.ManaInfusion.addInfusion(
    <contenttweaker:magic_stone>, <minecraft:stone>, 2500
    );

// 液态魔力桶
mods.botania.ManaInfusion.addInfusion(
    manaBucket, 
    <minecraft:bucket>, 1000
    );

mods.botania.ManaInfusion.addInfusion(
    <minecraft:bucket>, 
    manaBucket, -1000
    );

manaBucket.maxStackSize = 64;

mods.thermalexpansion.Transposer.addExtractRecipe(
    <liquid:fluidedmana> * 1000, manaBucket, 500, <minecraft:bucket> % 100
    );
