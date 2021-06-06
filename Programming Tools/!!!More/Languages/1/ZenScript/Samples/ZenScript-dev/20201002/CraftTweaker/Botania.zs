import crafttweaker.item.IItemStack as IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import crafttweaker.oredict.IOreDict;
import crafttweaker.item.IIngredient;
import crafttweaker.event.PlayerCraftedEvent;
import crafttweaker.data.IData;
import crafttweaker.entity.IEntity;
import crafttweaker.world.IWorld;

var ban as IItemStack[] = [
    <botania:rfgenerator>
];

for item in ban {
    Lib.removeAllRecipe(item);
}

recipes.addShaped("FlowerFertilizer", <botania:fertilizer>*4, [
    [<contenttweaker:green_matter>, <ore:dye>.marked("recipeBook")], 
    [<ore:dye>.marked("iColor"), <minecraft:dye:15>.marked("recipe")]
], 
function(out, ins, cInfo) {
    var recipeBookTransfer = ins.recipeBook.displayName;
    var recipeTransfer = ins.recipe.displayName;
    var IColor = ins.iColor.displayName;
    var finalN = recipeBookTransfer + recipeTransfer;
    if (finalN has ":") {
        if (IColor == "null") {
            return itemUtils.getItem(finalN);
        }
        return itemUtils.getItem(finalN, IColor);
    }
    return <botania:fertilizer>*4;
}, null);

mods.botania.Apothecary.removeRecipe(<botania:specialflower>.withTag({type: "entropinnyum"}));
mods.botania.Apothecary.addRecipe(<botania:specialflower>.withTag({type: "entropinnyum"}), [<botania:specialflower>.withTag({type: "endoflame"}), <botania:lens:11>, <enderio:block_reinforced_obsidian>, <botania:rune:12>, <botania:rune:11>, <botania:rune:13>]);
mods.botania.PureDaisy.addRecipe(<minecraft:quartz_block:1>, <appliedenergistics2:quartz_block>);
