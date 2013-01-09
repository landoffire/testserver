require "scripts/npcs"
require "scripts/npcs/chishiki_no_sabaku/testnpc"

atinit(function()
    npc_create("testnpc", npc.testnpc, GENDER_MALE, 2760 * TILESIZE,
               3456 * TILESIZE, testnpc_talk, testnpc_update)
end)