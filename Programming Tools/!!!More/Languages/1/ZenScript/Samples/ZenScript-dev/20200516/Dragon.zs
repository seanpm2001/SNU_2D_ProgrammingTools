var machineName = "dragon";
val recipesTickTime = 72000;

// 龙芯 龙锭*2 机动装置滚轴 虚空金属板 魔力油脂 花粉 发条之心
recipes.remove(<draconicevolution:draconic_core>);
recipes.addShapeless(<draconicevolution:draconic_core>,[<thaumcraft:grapple_gun_spool>,<thaumcraft:plate:3>,<thaumcraft:tallow>,<draconicevolution:draconium_ingot>*2,<forestry:pollen>,<thaumcraft:mind>]);

// 双足飞龙核心 龙芯*4 僵尸之脑*2 形态谐振器*2 下届之星*1
recipes.remove(<draconicevolution:wyvern_core>);
recipes.addShaped("WyvernCore",<draconicevolution:wyvern_core>,[[<thaumcraft:brain>,<draconicevolution:draconic_core>,<thaumcraft:morphic_resonator>],[<draconicevolution:draconic_core>,<minecraft:nether_star>,<draconicevolution:draconic_core>],[<thaumcraft:morphic_resonator>,<draconicevolution:draconic_core>,<thaumcraft:brain>]]);

// 觉醒龙芯合成 双足龙芯*5 觉醒锭*2 空白大师核心*2
recipes.addShaped("awakedcore", <draconicevolution:awakened_core>, [[<draconicevolution:draconic_ingot>, <draconicevolution:wyvern_core>, <thaumcraft:focus_3>], [<draconicevolution:wyvern_core>, <draconicevolution:wyvern_core>, <draconicevolution:wyvern_core>], [<thaumcraft:focus_3>, <draconicevolution:wyvern_core>, <draconicevolution:draconic_ingot>]]);

// 双足飞龙剑
mods.avaritia.ExtremeCrafting.addShaped("myvensword", <draconicevolution:wyvern_sword>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, null, null, null, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>,null], 
    [null,null, null, null, null, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ic2:crafting:4>,null], 
    [null,null, null, null, <ore:ingotBrickNetherGlazed>, <ore:ingotBrickNetherGlazed>, <ic2:crafting:4>, null,null], 
    [null,null, null, <ore:ingotBrickNetherGlazed>, <draconicevolution:infused_obsidian>, <ic2:crafting:4>, null, null,null], 
    [null,<draconicevolution:wyvern_core>, <ore:ingotVibrantAlloy>, <ic2:crafting:4>, <ic2:crafting:4>, null, null, null,null], 
    [null,null, <thaumcraft:elemental_sword>, <ore:ingotVibrantAlloy>, null, null, null, null,null], 
    [null,<ore:itemNutritiousStick>, null, <ore:ingotVibrantAlloy>, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足飞龙镐
mods.avaritia.ExtremeCrafting.addShaped("myvenpick", <draconicevolution:wyvern_pick>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, <thermalfoundation:material:656>, <thermalfoundation:material:656>, null, null, null, null,null], 
    [null,null, null, <ore:dustCryotheum>, <draconicevolution:wyvern_core>, null, null, null,null], 
    [null,null, null, null, <ore:ingotVibrantAlloy>, <thaumcraft:elemental_pick>, null, null,null], 
    [null,null, null, null, <ore:ingotBrickNetherGlazed>, <ore:ingotVibrantAlloy>, <draconicevolution:wyvern_core>, null,null], 
    [null,null, null, <ore:ingotBrickNetherGlazed>, null, null, <ore:dustCryotheum>, <thermalfoundation:material:656>,null], 
    [null,null, <ore:ingotBrickNetherGlazed>, null, null, null, null, <thermalfoundation:material:656>,null], 
    [null,<ore:itemNutritiousStick>, null, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足飞龙斧
mods.avaritia.ExtremeCrafting.addShaped("myvenaxe", <draconicevolution:wyvern_axe>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, <thermalfoundation:material:657>, <thermalfoundation:material:657>, null, null, null,null], 
    [null,null, <ic2:crafting:4>, <ore:dustCryotheum>, <thermalexpansion:capacitor:3>, <ic2:block_cutting_blade:2>, null, null,null], 
    [null,null, null, <ic2:crafting:4>, <ore:dustCryotheum>, <ic2:block_cutting_blade:2>, null, null,null], 
    [null,null, null, null, <ic2:crafting:4>, <thaumcraft:elemental_axe>, <draconicevolution:infused_obsidian>, null,null], 
    [null,null, null, null, <ore:ingotVibrantAlloy>, null, <draconicevolution:wyvern_core>, null,null], 
    [null,null, null, <ore:ingotVibrantAlloy>, null, null, null, null,null], 
    [null,null, <ore:itemNutritiousStick>, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足飞龙铲
mods.avaritia.ExtremeCrafting.addShaped("myvenshovel", <draconicevolution:wyvern_shovel>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, null, null, <ic2:crafting:4>, <ic2:crafting:4>, <ic2:crafting:4>,null], 
    [null,null, null, null, <ic2:crafting:4>, <ic2:crafting:4>, <draconicevolution:wyvern_core>, <ic2:crafting:4>,null], 
    [null,null, null, null, <enderio:item_dark_steel_hand>, <ore:dustCryotheum>, <ic2:crafting:4>, <ic2:crafting:4>,null], 
    [null,null, null, null, <ore:ingotVibrantAlloy>, <thaumcraft:elemental_shovel>, <ic2:crafting:4>, null,null], 
    [null,null, null, <ore:ingotVibrantAlloy>, null, null, null, null,null], 
    [null,null, <ore:ingotVibrantAlloy>, null, null, null, null, null,null], 
    [null,<ore:itemNutritiousStick>, null, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足飞龙弓
mods.avaritia.ExtremeCrafting.addShaped("myvenbow", <draconicevolution:wyvern_bow>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, <ic2:te:41>, <thaumcraft:module:1>, <ore:ingotVoid>, <ore:ingotVoid>, <ore:ingotVoid>, <ore:ingotVibrantAlloy>,null], 
    [null,<ic2:te:41>, <thermalfoundation:tool.bow_platinum>, <thaumcraft:turret:1>, <forge:bucketfilled>, null, <forestry:crafting_material:2>, null,null], 
    [null,<thaumcraft:module:1>, <thaumcraft:turret:1>, <thaumcraft:seal:14>, <draconicevolution:wyvern_core>, <forestry:crafting_material:2>, null, null,null], 
    [null,<ore:ingotVoid>, <forge:bucketfilled>, <draconicevolution:wyvern_core>, <forestry:crafting_material:2>, null, null, null,null], 
    [null,<ore:ingotVoid>, null, <forestry:crafting_material:2>, null, null, null, null,null], 
    [null,<ore:ingotVoid>, <forestry:crafting_material:2>, null, null, null, null, null,null], 
    [null,<ore:ingotVibrantAlloy>, null, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足头
mods.avaritia.ExtremeCrafting.addShaped("myvenhelm", <draconicevolution:wyvern_helm>, [
    [null,null,null,null,null,null,null,null,null],
    [null,<ore:blockRedstoneAlloy>, null, null, <minecraft:sea_lantern>, null, null, <ore:blockRedstoneAlloy>,null], 
    [null,<ore:blockRedstoneAlloy>, <ore:blockRedstoneAlloy>, <forestry:crafting_material:6>, <forestry:crafting_material:6>, <forestry:crafting_material:6>, <ore:blockRedstoneAlloy>, <ore:blockRedstoneAlloy>,null], 
    [null,null, <forestry:crafting_material:6>, <thaumcraft:module>, <ic2:quantum_helmet:26>, <thaumcraft:module>, <forestry:crafting_material:6>, null,null], 
    [null,null, <forestry:crafting_material:6>, <draconicevolution:infused_obsidian>, <thermalfoundation:material:657>, <draconicevolution:infused_obsidian>, <forestry:crafting_material:6>, null,null], 
    [null,null, <forestry:crafting_material:6>, <ore:nitor>, <draconicevolution:infused_obsidian>, <ore:nitor>, <forestry:crafting_material:6>, null,null], 
    [null,null, <ore:blockRockwool>, <thaumcraft:candle_blue>, <thaumcraft:banner_blue>, <thaumcraft:candle_blue>, <ore:blockRockwool>, null,null], 
    [null,null, <ore:blockRockwool>, <thaumcraft:candle_blue>, <thaumcraft:banner_blue>, <thaumcraft:candle_blue>, <ore:blockRockwool>, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足胸甲
mods.avaritia.ExtremeCrafting.addShaped("myvenchest", <draconicevolution:wyvern_chest>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null,null,null,null,null,null,null,null], 
    [null,null,<ore:ingotVibrantAlloy>,<ic2:crafting:4>,<draconicevolution:infused_obsidian>,<ic2:crafting:4>,<ore:ingotVibrantAlloy>,null,null], 
    [null,null,<ore:ingotVibrantAlloy>,<forestry:crafting_material:6>,<draconicevolution:infused_obsidian>,<forestry:crafting_material:6>,<ore:ingotVibrantAlloy>,null,null], 
    [null,null,<ore:ingotVibrantAlloy>,<forestry:crafting_material:6>,<ic2:quantum_chestplate:26>,<forestry:crafting_material:6>,<ore:ingotVibrantAlloy>,null,null], 
    [null,null,<ic2:crafting:4>,<ore:ingotVibrantAlloy>,<draconicevolution:wyvern_core>,<ore:ingotVibrantAlloy>,<ic2:crafting:4>,null,null], 
    [null,null,null,<ore:ingotVibrantAlloy>,<draconicevolution:wyvern_core>,<ore:ingotVibrantAlloy>,null,null,null], 
    [null,null,null, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足裤腿
mods.avaritia.ExtremeCrafting.addShaped("myvenlegs", <draconicevolution:wyvern_legs>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, null, null, null, null, null,null], 
    [null,null, <forestry:crafting_material:6>, <forestry:crafting_material:6>, <thaumcraft:morphic_resonator>, <forestry:crafting_material:6>, <forestry:crafting_material:6>, null,null], 
    [null,null, <thaumcraft:tube_filter>, <ic2:upgrade>, <ic2:quantum_leggings:26>, <ic2:upgrade>, <thaumcraft:tube_filter>, null,null], 
    [null,null, <draconicevolution:wyvern_core>, <ic2:crafting:4>, <forestry:crafting_material:6>, <ic2:crafting:4>, <draconicevolution:wyvern_core>, null,null], 
    [null,null, null, <ic2:crafting:4>, <forestry:crafting_material:6>, <ic2:crafting:4>, null, null,null], 
    [null,null, null, <ic2:crafting:4>, <forestry:crafting_material:6>, <ic2:crafting:4>, null, null,null], 
    [null,null, null, null, null, null, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 双足靴子
mods.avaritia.ExtremeCrafting.addShaped("myvenboots", <draconicevolution:wyvern_boots>, [
    [null,null,null,null,null,null,null,null,null],
    [null,null, null, null, null, null, null, null,null], 
    [null,null, null, null, null, null, null, null,null], 
    [null,null, null, null, null, null, null, null,null], 
    [null,null, <ore:ingotVibrantAlloy>, <draconicevolution:wyvern_core>, <thermaldynamics:duct_64:2>, <draconicevolution:wyvern_core>, <ore:ingotVibrantAlloy>, null,null], 
    [null,null, <ore:ingotVibrantAlloy>, <ore:quicksilver>, <thermaldynamics:duct_64:2>, <ore:quicksilver>, <ore:ingotVibrantAlloy>, null,null], 
    [null,null, null, <forestry:crafting_material:6>, <ic2:quantum_boots:26>, <forestry:crafting_material:6>, null, null,null], 
    [null,null, null, <minecraft:piston>, <ore:dustCryotheum>, <minecraft:piston>, null, null,null],
    [null,null,null,null,null,null,null,null,null]
]);

// 龍工具
// 神龙剑 秘金板*6 高级空白核心*1 双足剑 神龙能量核心
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "sword", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_sword>)
    .addItemInput(<thaumadditions:mithminite_plate>*6)
    .addItemInput(<thaumcraft:focus_2>)
    .addItemInput(<draconicevolution:wyvern_sword>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 神龙镐 同神龙剑
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "pick", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_pick>)
    .addItemInput(<thaumadditions:mithminite_plate>*6)
    .addItemInput(<thaumcraft:focus_2>)
    .addItemInput(<draconicevolution:wyvern_pick>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 同神龙剑
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "axe", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_axe>)
    .addItemInput(<thaumadditions:mithminite_plate>*6)
    .addItemInput(<thaumcraft:focus_2>)
    .addItemInput(<draconicevolution:wyvern_axe>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 同神龙剑
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "shovel", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_shovel>)
    .addItemInput(<thaumadditions:mithminite_plate>*6)
    .addItemInput(<thaumcraft:focus_2>)
    .addItemInput(<draconicevolution:wyvern_shovel>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 龍装备合成
// 神龙头 扩展合成锡奇点*2 秘金神秘使兜帽 双足头 神龙能量核心
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "helm", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_helm>)
    .addItemInput(<cuisine:food:16>*128)
    .addItemInput(<thaumadditions:mithminite_hood>)
    .addItemInput(<draconicevolution:wyvern_helm>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 神龙胸 损坏的铁砧 秘金神秘使法袍 双足胸 神龙能量核心
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "chest", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_chest>)
    .addItemInput(<minecraft:anvil:2>)
    .addItemInput(<thaumadditions:mithminite_robe>)
    .addItemInput(<draconicevolution:wyvern_chest>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 神龙裤 检测器 秘金神秘使腰带 双足裤 神龙能量核心
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "legs", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_legs>)
    .addItemInput(<theoneprobe:probe_goggles>)
    .addItemInput(<thaumadditions:mithminite_belt>)
    .addItemInput(<draconicevolution:wyvern_legs>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 神龙鞋 纯净之花 秘金神秘使靴子 双足鞋 神龙能量核心
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "boots", machineName, recipesTickTime)
    .addEnergyPerTickInput(1024)
    .addFluidInput(<liquid:pyrotheum>*5000)
    .addItemOutput(<draconicevolution:draconic_boots>)
    .addItemInput(<thaumadditions:puriflower>)
    .addItemInput(<thaumadditions:mithminite_boots>)
    .addItemInput(<draconicevolution:wyvern_boots>)
    .addItemInput(<draconicevolution:draconic_energy_core>)
    .build();

// 龍权
mods.modularmachinery.RecipeBuilder.newBuilder(machineName + "_" + "power", machineName, recipesTickTime)
    .addEnergyPerTickInput(4096)
    .addFluidInput(<liquid:cloud_seed_concentrated>*25000)
    .addItemOutput(<draconicevolution:draconic_staff_of_power>)
    .addItemInput(<draconicevolution:draconic_sword>)
    .addItemInput(<draconicevolution:draconic_pick>)
    .addItemInput(<draconicevolution:draconic_axe>)
    .addItemInput(<draconicevolution:draconic_shovel>)
    .build();
