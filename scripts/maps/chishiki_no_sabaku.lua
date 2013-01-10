require "scripts/npcs"
require "scripts/npcs/chishiki_no_sabaku/testnpc"
require "scripts/npcs/chishiki_no_sabaku/testnpc2"

atinit(function()
    npc_create("testnpc", npc.testnpc, GENDER_MALE, 90 * TILESIZE + TILESIZE /2,
               112 * TILESIZE + TILESIZE / 2, testnpc_talk, testnpc_update)
end)

atinit(function()
    npc_create("testnpc2", npc.testnpc2, GENDER_MALE, 90 * TILESIZE + TILESIZE /2,
               114 * TILESIZE + TILESIZE / 2, testnpc2_talk, testnpc2_update)
end)