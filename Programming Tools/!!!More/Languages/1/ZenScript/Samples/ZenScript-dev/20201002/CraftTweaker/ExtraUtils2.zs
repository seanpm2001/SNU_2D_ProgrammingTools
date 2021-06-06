import crafttweaker.item.IItemStack;

var remove as IItemStack[] = [
    <tconstruct:smeltery_controller>,
    <tconstruct:soil>
];

for item in remove {
    recipes.remove(item);
}
