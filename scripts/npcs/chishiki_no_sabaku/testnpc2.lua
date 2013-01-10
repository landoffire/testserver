function testnpc2_talk(npc, ch)
    npc_say(npc, ch, "Good day!",
            "This is Pihro's first self written lua script. "
            .. "His learning of manaserv is increasing in volume.")
end

function testnpc2_update(npc)
    npclib.walkaround_wide(npc)
end

