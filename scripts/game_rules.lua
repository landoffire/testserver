require "scripts/libnpc"

function game_rules(npc, ch)
    local function info(...)
        npc_info(npc, ch, ...)
    end

    info("Players breaking the following rules may be banned (up to and including "
         .. "a permanent ban) or have their characters reset at the GM's "
         .. "discretion:",
         "1. Do not abuse other players (insults, swearing, and the like directed "
         .. "to a particular person or persons)",
         "2. No bots (including ANY AFK activity or automated following)",
         "3. No spamming / flooding (including trade spam)",
         "4. No begging",
         "5. Speak English on public chat",
         "6. Treat others the same way you would like to be treated")
    info("AFK botting will be determined by talking to players who are moving "
         .. "and/or attacking.",
        "Automated following will be determined by observation")
end
