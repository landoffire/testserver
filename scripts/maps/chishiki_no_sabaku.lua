require "scripts/npcs"
require "scripts/npcs/chishiki_no_sabaku/testnpc"

atinit(function()
    npc_create("testnpc", npc.testnpc, GENDER_MALE, 90 * TILESIZE + TILESIZE /2,
               112 * TILESIZE + TILESIZE / 2, testnpc_talk, testnpc_update)
end)