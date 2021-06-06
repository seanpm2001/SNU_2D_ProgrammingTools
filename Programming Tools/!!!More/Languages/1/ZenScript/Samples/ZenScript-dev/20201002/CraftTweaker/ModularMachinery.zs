recipes.addShaped(<modularmachinery:blockcasing:3>, 
    [[<appliedenergistics2:crank>, <appliedenergistics2:crank>, <appliedenergistics2:crank>], 
    [<appliedenergistics2:crank>, <extrautils2:ingredients:1>, <appliedenergistics2:crank>],
    [<appliedenergistics2:crank>, <appliedenergistics2:crank>, <appliedenergistics2:crank>]]
);

recipes.addShaped(<modularmachinery:blockcasing:1>, 
    [[<modularmachinery:blockcasing>, <tconstruct:shard>.withTag({Material: "paper"}), <modularmachinery:blockcasing>], 
    [<tconstruct:shard>.withTag({Material: "paper"}), <tconstruct:shard>.withTag({Material: "paper"}), <tconstruct:shard>.withTag({Material: "paper"})],
    [<modularmachinery:blockcasing>, <tconstruct:shard>.withTag({Material: "paper"}), <modularmachinery:blockcasing>]]
);

recipes.addShaped(<modularmachinery:blockfluidoutputhatch:2>, 
    [[<modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>, <modularmachinery:itemmodularium>], 
    [<modularmachinery:itemmodularium>, <minecraft:bucket>, <modularmachinery:itemmodularium>],
    [<modularmachinery:itemmodularium>, null, <modularmachinery:itemmodularium>]]
);

mods.modularmachinery.RecipeBuilder.newBuilder("Lava_stove", "alloy_stove", 6000)
    .addFluidOutput(<liquid:lava>*1000)
    .addItemInput(<contenttweaker:grey_matter>*4)
    .build();

recipes.remove(<modularmachinery:itemmodularium>);
recipes.addShaped(<modularmachinery:itemmodularium>, 
    [[<ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>], 
    [<ore:ingotGold>, null, <minecraft:redstone>], 
    [<minecraft:redstone>, <minecraft:redstone>, <minecraft:redstone>]]
);

// Tier3电磁采矿
mods.modularmachinery.RecipeBuilder.newBuilder("tier3_ore", "tier3", 4000)
    .addEnergyPerTickInput(2000)
    .addItemOutput(<minecraft:gold_ore>)
    .addItemOutput(<minecraft:iron_ore>)
    .addItemOutput(<minecraft:lapis_ore>)
    .addItemOutput(<minecraft:diamond_ore>)
    .addItemOutput(<minecraft:redstone_ore>)
    .addItemOutput(<minecraft:emerald_ore>)
    .addItemOutput(<minecraft:quartz_ore>)
    .addItemOutput(<appliedenergistics2:charged_quartz_ore>)
    .addItemOutput(<thermalfoundation:ore>)
    .addItemOutput(<thermalfoundation:ore:1>)
    .addItemOutput(<thermalfoundation:ore:2>)
    .addItemOutput(<thermalfoundation:ore:3>)
    .addItemOutput(<thermalfoundation:ore:4>)
    .addItemOutput(<thermalfoundation:ore:5>)
    .addItemOutput(<thermalfoundation:ore:6>)
    .addItemOutput(<thermalfoundation:ore:7>)
    .addItemOutput(<ic2:resource:4>)
    .addItemOutput(<draconicevolution:draconium_ore:1>)
    .addItemOutput(<forestry:resources>)
    .addItemOutput(<thermalfoundation:ore:8>)
    .addItemOutput(<thermalfoundation:ore_fluid:2>)
    .addItemOutput(<thermalfoundation:ore_fluid:4>)
    .addItemOutput(<tconstruct:ore>)
    .addItemOutput(<tconstruct:ore:1>)
    .addItemOutput(<minecraft:prismarine_shard>)
    .addItemOutput(<minecraft:prismarine_crystals>)
    .build();
