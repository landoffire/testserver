require "scripts/npcs"
require "scripts/npcs/Tulimshar_suburbs/liana"

atinit(function()
    npc_create("Liana", npc.Liana, GENDER_FEMALE, 82.5 * TILESIZE,
               96.5 * TILESIZE, liana_talk, liana_update)
end)
