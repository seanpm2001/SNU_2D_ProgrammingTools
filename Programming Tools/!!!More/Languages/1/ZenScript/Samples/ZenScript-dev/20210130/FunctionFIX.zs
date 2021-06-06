#priority 32765
import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IWorld;

var allNBTContainer = [<appliedenergistics2:storage_cell_1k>,<appliedenergistics2:storage_cell_4k>,<appliedenergistics2:storage_cell_16k>,<appliedenergistics2:storage_cell_64k>,<extracells:storage.physical>,<extracells:storage.physical:1>,<extracells:storage.physical:2>,<extracells:storage.physical:3>,<enderio:block_tank>,<enderio:block_tank:1>,<enderio:block_omni_reservoir>] as IItemStack[];
//声明所有带有流体容器的bracket

var wrench = <thermalfoundation:wrench>;
for i, item in allNBTContainer {
    recipes.addShaped("NBTContainerEliminater"+i, item, [
        [wrench.reuse(), item.marked("item")], 
        [null, null]
    ],null,null);
}
//清理容器

recipes.addHiddenShapeless("Communistsunite!",<extrabotany:splashgrenade>.withTag({brewKey: "haste"}),
    [<teastory:sickle>,<contenttweaker:hammer>],
    function(out, ins, cInfo) {
        var iData as IData = {doPlayerCommunist : 0};
        iData += cInfo.player.data;
        if(iData.doPlayerCommunist.asInt() > 0){
            return <botania:brewflask>.withTag({brewKey: "haste"});
        }
        return out;
    },
    function (out, info, player) {
        var iData as IData = {doPlayerCommunist : 0};
        iData += player.data;
        player.update({doPlayerCommunist : iData.doPlayerCommunist.asInt() + 1 });
    }
);
//新增镰刀锤子合成急迫药水的彩蛋

recipes.addShaped("firstFractal",<extrabotany:firstfractal>.withTag({ench: [{lvl: 3 as short, id: 39 as short}, {lvl: 4 as short, id: 30 as short}, {lvl: 3 as short, id: 21 as short}, {lvl: 1 as short, id: 15 as short}, {lvl: 5 as short, id: 16 as short}, {lvl: 5 as short, id: 11 as short}]}),[
    [null,<extrabotany:cosmetic:9>.withTag({}),null],
    [<astralsorcery:itemcraftingcomponent:4>,<extrabotany:firstfractal>,<astralsorcery:itemcraftingcomponent:4>],
    [null,<forge:bucketfilled>.withTag({FluidName: "astralsorcery.liquidstarlight", Amount: 1000}),null]
]);
//天顶剑的强化合成

recipes.addShaped("dyeblack",<thermalfoundation:dye>,[
    [<ore:sand>.marked("ruber"),<ore:listAllfruit>.marked("thickeners")],
    [<ore:coal>.marked("material"),null]
],function(out, ins, cInfo) {
    var ckData as IData = {doPlayerCommunist : 0,doPlayerHasNBTBucket : true};
    var forestryClass as string[] = [ins.material.displayName,ins.ruber.displayName];
    var meta = ins.thickeners.displayName;
    var forestryDetector as string = forestryClass[0]+forestryClass[1];
    ckData += cInfo.player.data;
    if(ckData.doPlayerCommunist.asInt() > 0){
            if (forestryDetector has ":") {
                if (meta == "null") {
                    return itemUtils.getItem(forestryDetector);
                }
                return itemUtils.getItem(forestryDetector, meta);
            }
    }
    return out;
}, null);
//增加染料合成和林业联动
