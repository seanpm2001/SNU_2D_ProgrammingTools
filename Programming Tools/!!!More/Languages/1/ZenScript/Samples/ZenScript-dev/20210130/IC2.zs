import crafttweaker.item.IItemStack as IItemStack;

var remove = [
    <super_solar_panels:machines:10>,
    <super_solar_panels:crafting:31>,
    <energyconverters:energy_producer_eu:4>
] as IItemStack[];
for myRemove in remove{
    recipes.remove(myRemove);
}

var removeAndHide = [
    <energyconverters:energy_producer_eu:0>,
    <energyconverters:energy_producer_eu:1>,
    <energyconverters:energy_producer_eu:2>,
    <energyconverters:energy_producer_eu:3>,
    <energyconverters:energy_consumer_eu:0>,
    <energyconverters:energy_consumer_eu:1>,
    <energyconverters:energy_consumer_eu:2>,
    <energyconverters:energy_consumer_eu:3>
] as IItemStack[];
for myRemoveAndHide in removeAndHide{
    mods.jei.JEI.removeAndHide(myRemoveAndHide);
    recipes.remove(myRemoveAndHide);
}

recipes.addShaped(<super_solar_panels:machines:10>, [
    [null, <super_solar_panels:crafting:32>, null], 
    [null, <super_solar_panels:crafting:21>, null], 
    [null, <super_solar_panels:crafting:32>, null]
]);
// Photonic 富集核心配方修复

recipes.addShaped(<super_solar_panels:machines:10>, [
    [<extrabotany:material:3>, <super_solar_panels:crafting:0>, <extrabotany:material:3>], 
    [<super_solar_panels:crafting:44>, <extrabotany:natureorb>, <super_solar_panels:crafting:44>], 
    [<extrabotany:material:3>, <super_solar_panels:crafting:0>, <extrabotany:material:3>]
]);
// 中子流体生成器

var energyPlate = <forestry:chipsets:3>.withTag({T: 3 as short, "CA.I3": "forestry.electric.boost.2", "CA.I1": "forestry.electric.boost.2", "CA.I2": "forestry.electric.boost.2", "CA.I0": "forestry.electric.boost.2", LY: "forestry.engine.tin"});
recipes.addShaped(<energyconverters:energy_consumer_eu:4>, [
    [<energyconverters:energy_producer_eu:4>, null], 
    [null, null]
]);
recipes.addShaped(<energyconverters:energy_producer_eu:4>, [
    [<ore:blockIron>, <ic2:cable:1>, <ore:blockIron>], 
    [<ore:gearPlatinum>, <botania:manaresource:4>, energyPlate], 
    [<ore:blockIron>, <thermalexpansion:cell>, <ore:blockIron>]
]);
// 特高压输出器
