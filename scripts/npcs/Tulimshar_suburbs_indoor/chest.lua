function chest_talk(npc, ch)
    if chr_get_quest(ch, "tutorial_chest") == "opened" then
        npc_message(npc, ch, "The chest is empty.")
    elseif chr_get_quest(ch, "tutorial_progress") == "chest unlocked" then
        npc_message(npc, ch, "You take a simple cotton shirt out of the chest.")
        chr_inv_change(ch, "Cotton shirt", 1)
        chr_set_quest(ch, "tutorial_progress", "chest opened")
        chr_set_quest(ch, "tutorial_chest", "opened")
    else
        npc_message(npc, ch, "The chest is locked.")
    end
end
