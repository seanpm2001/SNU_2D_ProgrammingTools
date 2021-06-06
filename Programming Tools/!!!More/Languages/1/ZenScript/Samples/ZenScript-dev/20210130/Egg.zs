#priority 1000

val TNT = <minecraft:tnt>;
val mySkull = <contenttweaker:skull_block>;

recipes.addShaped(mySkull, 
[
    [TNT, TNT], 
    [TNT, <minecraft:skull:4>]
]);

mySkull.addShiftTooltip(format.aqua("语言切换成英文试试!"));

mods.jei.JEI.addDescription(
    [<minecraft:nether_star>],
    [" 老玩家的噩梦 ! "]);
