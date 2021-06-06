val zombie = <entity:minecraft:zombie>;

zombie.removeDrop(<minecraft:rotten_flesh>);
zombie.addDrop(<minecraft:rotten_flesh> % 70, 1, 3);
zombie.addDrop(<minecraft:leather> % 70, 1, 3);
