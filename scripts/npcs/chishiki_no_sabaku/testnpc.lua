function testnpc_talk(npc, ch)
    npc_say(npc, ch, "Heya",
            "This is a testing script based off of a script by Kirua. "
            .. "It's pretty warm in this desert...")
    npc_say(npc, ch, "",
            "Pihro is getting used to this lua scripting he thinks... "
            .. "We'll find out soon enough.")
end

function testnpc_update(npc)
    npclib.walkaround_small(npc)
end
