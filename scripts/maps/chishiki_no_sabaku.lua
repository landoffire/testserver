require "scripts/npcs"
require "scripts/npcs/chishiki_no_sabaku/testnpc"

atinit(function()
    npc_create("testnpc", npc.testnpc, GENDER_MALE, 82.5 * TILESIZE,
               96.5 * TILESIZE, testnpc_talk, testnpc_update)
end)