function npc_say(npc, ch, who, ...)
    local data = "\""
    if select("#", ...) == 1 then
        data = data .. ...
    else
        data = data .. table.concat({...}, "\n")
    end

    data = data .. "\""
    if who == "" then
        npc_message(npc, ch, data)
    else
        npc_message(npc, ch, "[" .. who .. "]\n" .. data)
    end
end

function npc_info(npc, ch, ...)
    local data = ""
    if select("#", ...) == 1 then
        data = ...
    else
        data = table.concat({...}, "\n")
    end

    npc_message(npc, ch, data)
end
