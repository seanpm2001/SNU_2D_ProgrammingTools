import mods.dropt.Dropt;

Dropt.list("remove")
    .priority(0)
    .add(Dropt.rule()
        .matchDrops([<astralsorcery:blockmarble>.or(<astralsorcery:blockmarble:1>)])
        .addDrop(Dropt.drop()
            .items([<contenttweaker:calcium_carbonate_dust>])
        )
    );
Dropt.list("ore_fix")
    .add(Dropt.rule()
        .matchBlocks(["super_solar_panels:iridium_ore"])
        .addDrop(Dropt.drop()
            .items([<thermalfoundation:material:71>])
        )
    );
Dropt.list("ore_fix")
    .add(Dropt.rule()
        .matchBlocks(["super_solar_panels:platium_ore"])
        .addDrop(Dropt.drop()
            .items([<thermalfoundation:material:70>])
        )
    );
