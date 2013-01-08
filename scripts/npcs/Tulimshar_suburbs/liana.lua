require "scripts/lua/npclib"
require "scripts/libnpc"

function liana_talk(npc, ch)
    npc_say(npc, ch, "Liana",
            "Tulimshar is a large city. I'm sure glad I live in the "
            .. "suburbs because I know where everything's at.")
    npc_say(npc, ch, "",
            "I think Tanisha is in the building to the right.  That girl "
            .. "is growing up fast.")
end

function liana_update(npc)
    npclib.walkaround_small(npc)
end
