// 此魔改全周目通用

import crafttweaker.item.IItemTransformer;
import crafttweaker.events.IEventManager;
import crafttweaker.item.IItemStack;

<custommc:item512>.displayName = "§b兰波顿晶体";
<enderio:item_material:18>.displayName = "§c能量晶体";

var energyCrystal = <enderio:item_material:18>;
var lapotronCrystal = <custommc:item512>;
var goldCable = <ic2:cable:2>.withTag({type: 2 as byte, insulation: 2 as byte});
var ironCable = <ic2:cable:3>.withTag({type: 3 as byte, insulation: 3 as byte});

recipes.remove(<enderio:item_material:18>);
recipes.remove(<ic2:lapotron_crystal:26>.withTag({}));
recipes.remove(<ic2:te:74>.withTag({}));
recipes.remove(<ic2:te:71>.withTag({}));
recipes.remove(<ic2:energy_pack:26>.withTag({}));
recipes.remove(<ic2:te:80>);

lapotronCrystal.addTooltip("§a自动化合成专用物品");
energyCrystal.addTooltip("§a自动化合成专用物品");

recipes.addShaped(lapotronCrystal, [[<ore:dustLapis>, <ic2:crafting:2>, <ore:dustLapis>], [<ore:dustLapis>, energyCrystal, <ore:dustLapis>], [<ore:dustLapis>, <ic2:crafting:2>, <ore:dustLapis>]]);
// 兰波顿晶体

recipes.addShaped(energyCrystal, [[<ic2:dust:6>, <ic2:dust:6>, <ic2:dust:6>], [<ic2:dust:6>, <ic2:dust:6>, <ic2:dust:6>], [<ic2:dust:6>, <ic2:dust:6>, <ic2:dust:6>]]);
// 能量水晶

recipes.addShaped(<ic2:te:74>.withTag({}), [[goldCable, energyCrystal, goldCable], [energyCrystal, <ic2:resource:12>, energyCrystal], [goldCable, energyCrystal, goldCable]]);
// MFE

recipes.addShaped(<ic2:energy_pack:26>.withTag({}), [[<ic2:crafting:2>, <ic2:casing:3>, <ic2:crafting:2>], [energyCrystal, <ic2:casing:3>, energyCrystal], [<ic2:casing:3>, null,<ic2:casing:3>]]);
// 能量水晶储电背包

recipes.addShaped(<ic2:mining_laser:26>.withTag({}), [[<ore:dustRedstone>, <ore:dustRedstone>, energyCrystal], [<ic2:crafting:3>, <ic2:crafting:3>, <ic2:crafting:2>], [null,<ic2:crafting:3>, <ic2:crafting:3>]]);
// 采矿镭射枪

recipes.addShaped(<ic2:te:75>.withTag({}), [[lapotronCrystal, <ic2:crafting:2>, lapotronCrystal], [lapotronCrystal, <immersiveengineering:metal_device1:5>, lapotronCrystal], [lapotronCrystal, <ic2:resource:13>, lapotronCrystal]]);
// MFSU

recipes.addShaped(<ic2:te:80>, [[null,ironCable,null], [<ic2:crafting:2>, <ic2:te:79>, lapotronCrystal], [null,ironCable,null]]);
// 超高压变压器
