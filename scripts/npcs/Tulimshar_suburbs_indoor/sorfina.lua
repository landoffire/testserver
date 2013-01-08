require "scripts/libnpc"
require "scripts/game_rules"

local function walk_to_carpet(npc, ch)
    npc_say(npc, ch, "Sorfina",
            "Try to take a few steps and walk to that red carpet over there.",
            "Just use the arrow keys or click on the place you want to go to.")
end

local function tutorial(npc, ch)
    npc_message(npc, ch, "She smiles at you.")
    npc_say(npc, ch, "Sorfina", "A wise decision.")
    npc_say(npc, ch, "",
            "You still look rather shaky.",
            "You're not used to the hot weather, right?")

    walk_to_carpet(npc, ch)
    chr_set_quest(ch, "tutorial_progress", "walk to carpet")
end

local function introduction(npc, ch)
    local function say(who, ...)
        npc_say(npc, ch, who, ...)
    end

    local function info(...)
        npc_info(npc, ch, ...)
    end

    local function choices(...)
        return npc_choice(npc, ch, ...)
    end

    game_rules(npc, ch)
    say("Old Woman",
         "It seems you collapsed after you left the boat that brought you to "
         .. "Tulimshar.",
         "A group of ragtags immediately took advantage of that and stole all "
         .. "your stuff!")
    say("",
         "My little granddaughter Tanisha saw that, but couldn't do anything "
         .. "to stop them.",
         "She hurried to get someone to help. It was too late to catch the "
         .. "thieves, but at least the helpers brought you here to recover.")
    say("",
         "We're in the suburbs of Tulimshar here and this area of the town is "
         .. "full of shady people, so I don't think there's a chance to get "
         .. "your stuff back.")
    info("She has a sad look on her face, but then she shakes her head and smiles.")
    say("Old Woman",
        "Did you come here to look for a job? Many young people come to Tulimshar "
        .. "for this reason.")
    say("",
        "I can tell you some useful things, if you want to hear.",
        "Oh, and by the way my name is Sorfina.")

    local choice = choices("That would be great!",
                           "No, thanks. I already know how things are going.")

    if choice == 1 then
        tutorial(npc, ch)
    else
        say("Sorfina",
            "Really? You seem quite unexperienced. Listening to some advice won't "
            .. "hurt.")
        local choice = choices("Thinking about it twice... please tell me.",
                               "Yeah, but thanks for the offer. Bye.")
        if choice == 1 then
            tutorial(npc, ch)
        else
            say("Sorfina",
                "Alright, if you say so. But take at least this.",
                "Good luck.")
            chr_inv_change(ch, "Knife", 1)
            chr_inv_change(ch, "Cotton shirt", 1)
            chr_money_change(ch, 50)
            chr_set_quest(ch, "tutorial_door", "can out")
            chr_set_quest(ch, "tutorial_progress", "done")
        end
    end
end

local function open_chest(npc, ch)
    npc_say(npc, ch, "Sorfina", "In that chest there is a shirt you can have.")
    npc_say(npc, ch, "",
            "To interact with things in your environment or talk to NPCs you "
            .. "can either click on it or press N to focus and T to "
            .. "talk/activate.")
    npc_say(npc, ch, "", "Now get the shirt out of the chest.")
end

local function explain(npc, ch)
    local choice = npc_choice(npc, ch,
                              "... walking?",
                              "... talking?",
                              "... the inventory and items?",
                              "... shortcuts?",
                              "... what to do in Tulimshar?",
                              "... nevermind.")
    if choice == 1 then
        npc_say(npc, ch, "Sorfina",
                "You can use the arrow keys to walk around.",
                "Or just click on the place you want to go to.",
                "But this only works if that place is reachable and walkable.")
    elseif choice == 2 then
        npc_say(npc, ch, "Sorfina",
                "If you want to talk to a normal person, you can click at him or "
                .. "her.",
                "Or you can press N to focus on the nearest person and then press "
                .. "T to talk.")
        npc_say(npc, ch, "",
                "If you want to talk to other adventurers, press Enter to open "
                .. "your chat window.",
                "Then type your message and press Enter to send.")
        npc_say(npc, ch, "",
                "You may want to talk privately to another adventurer sometimes. "
                .. "In that case you can whisper.",
                "After pressing Enter type '/whisper [name] [message]'.",
                "Or you can right click on someone and choose the whisper option.")
        npc_say(npc, ch, "", "Press F7 to show and hide your chat window.")
    elseif choice == 3 then
        npc_say(npc, ch, "Sorfina",
                "There are three types of items.",
                "They can be Consumables, Equipment or Miscellaneous.")
        npc_say(npc, ch, "",
                "Consumable items such as Potions, can be used only once.",
                "After use, they will disappear from your inventory.",
                "There are some rare items that can be used but don't get "
                .. "consumed.")
        npc_say(npc, ch, "",
                "Equipment items like Armors, Weapons, Accessories can be equipped "
                .. "for fashionable purposes or to raise your status.")
        npc_say(npc, ch, "",
                "Miscellaneous items such as maggot slime, can be used in creating "
                .. "other items, or just to trade and sell.")
        npc_say(npc, ch, "",
                "Press F3 to open your inventory.",
                "When placing your cursor over an item there, you can see a box "
                .. "with some information about that item.")
        npc_say(npc, ch, "",
                "To use or equip an item, select it by clicking on it.",
                "Then press Use or Equip.")
    elseif choice == 4 then
        npc_say(npc, ch, "Sorfina",
                "Press F8  or click the Shortcut button in the bar at the upper "
                .. "right to open your shortcut window.")
        npc_say(npc, ch, "",
                "You can select the item you want to put on a shortcut with your "
                .. "mouse and then click on the position in the shortcut window "
                .. "you want to place it.")
        npc_say(npc, ch, "",
                "Now you can use or equip/unequip it by pressing the number of the "
                .. "shortcut.")
    elseif choice == 5 then
        npc_say(npc, ch, "Sorfina",
                "I suggest to go to the bazaar near the south gate.",
                "We're in the north of Tulimshar here, so you have to walk across "
                .. "the town.")
        npc_say(npc, ch, "",
                "When you leave this area to the Southeast, you'll come to the "
                .. "docks.",
                "Follow the street to the south to pass the old town gates.")
        npc_say(npc, ch, "",
                "Turn west at the next intersection. You'll pass by the gates of "
                .. "Tulimshar's famous magic school there.",
                "Just follow the street to the south and you'll reach the bazaar.")
        npc_say(npc, ch, "",
                "I heard Aidan is looking for brave adventurers, you might want to "
                .. "talk to him.",
                "Usually the bazaar is bustling with activity, there are many "
                .. "people who can help.",
                "Talk to everybody.  You can never tell when they might know "
                .. "something useful.")
    end
end

local function gave_money(npc, ch)
    npc_say(npc, ch, "Sorfina", "That's much better, don't you think?")
    npc_say(npc, ch, "",
            "I think this will help you a bit. To get more information, "
            .. "press the button Setup and look at the controls on the "
            .. "Keyboard tab. You can also change them as you like.",
            "Talk to me again if you want me to explain more things.")
    npc_say(npc, ch, "",
            "Now you should go to see my granddaughter, she is very "
            .. "worried. She's in the storehouse, that's the second "
            .. "building southeast from here.")
    npc_say(npc, ch, "",
            "Oh, and if you're looking for work, you should talk to Aidan "
            .. "when you go to Tulimshar. They're giving rewards for "
            .. "monster hunting.",
            "You can find him near the south gate.")
    npc_message(npc, ch, "She hesitates a moment.")
    npc_say(npc, ch, "Sorfina",
            "And here is some money for you. At least you can buy "
            .. "yourself something to eat.",
            "Good luck!")
    chr_money_change(ch, 30)
    chr_set_quest(ch, "tutorial_progress", "sorfina gave money")
    chr_set_quest(ch, "tutorial_door", "can out")
end

function sorfina_talk(npc, ch)
    local progress = chr_get_quest(ch, "tutorial_progress")
    if progress == "" then
        chr_set_quest(ch, "tutorial_progress", "start")
        introduction(npc, ch)
    elseif progress == "walk to carpet" then
        walk_to_carpet(npc, ch)
    elseif progress == "steped on carpet" then
        npc_say(npc, ch, "Sorfina",
                "I'm glad you're recovering.",
                "Now you should get dressed again.")
        npc_message(npc, ch, "Sorfina unlocks the chest behind her.")
        open_chest(npc, ch)
        chr_set_quest(ch, "tutorial_progress", "chest unlocked")
    elseif progress == "chest unlocked" then
        open_chest(npc, ch)
    elseif progress == "chest opened" then
        if chr_inv_count(ch, false, true, "Cotton shirt") == 0 then
            npc_say(npc, ch, "Sorfina", "Great! Now you can equip it")
            npc_say(npc, ch, "",
                    "You can open your inventory by pressing F3 or clicking on the "
                    .. "'Inventory' button in the bar at the upper right corner.",
                    "After we finish talking, click on the shirt and press the equip "
                    .. "button.")
            chr_set_quest(ch, "tutorial_progress", "put on clothes")
        else
            gave_money(npc, ch)
        end
    elseif progress == "put on clothes" then
        if chr_inv_count(ch, false, true, "Cotton shirt") == 0 then
            npc_say(npc, ch, "Sorfina",
                    "Press F3 or click on the Inventory button in the bar at the "
                    .. "upper right corner to open your bag.")
            npc_say(npc, ch, "",
                    "Once we stop talking, click on the shirt and press the equip "
                    .. "button.")
            npc_say(npc, ch, "",
                    "Talk to me again after you get dressed. You can either click "
                    .. "on me, or press N to focus on me and T to talk.")
        else
            gave_money(npc, ch)
        end
    else
        if being_get_base_attribute(ch, ATTR_HP) <
           being_get_base_attribute(ch, ATTR_MAX_HP) then
            npc_say(npc, ch, "Sorfina",
                    "Hello Dear! You look tired, you should rest a moment.")
            npc_message(npc, ch, "You take a short nap and feel refreshed.")
            being_heal(ch)
        end

        npc_say(npc, ch, "Sorfina",
                "Make yourself at home! Do you have any questions?")

        if chr_get_quest(ch, "tutorial_hasan") == "stop you" then
            local choice =
                npc_choice(npc, ch,
                           "A guy named Hasan won't let me enter Tulimshar.",
                           "Yes, could you explain again about...",
                           "No, thanks.")
            if choice == 1 then
                npc_say(npc, ch, "Sorfina",
                        "Ah, Hasan. He's causing trouble again?")
                npc_message(npc, ch, "She shakes her head.")
                npc_say(npc, ch, "Sorfina",
                        "This guy has been a plague ever since he could walk. He's "
                        .. "always causing trouble.")
                npc_say(npc, ch, "",
                            "And his father... Well, one day his father thought he "
                            .. "should teach Hasan a lesson.")
                npc_say(npc, ch, "",
                            "He took him into the desert and then left him there!",
                            "Hasan was only seven years old!")
                npc_say(npc, ch, "",
                            "I never understood how someone could do something like "
                            .. "that to a child, even if it's a rascal like Hasan.")
                npc_say(npc, ch, "",
                            "Anyway, Hasan tried to find his way back home, but "
                            .. "stumbled into a nest of scorpions!")
                npc_message(npc, ch, "She shakes her head.")
                npc_say(npc, ch, "",
                        "If Valon hadn't have come along that moment, Hasan would "
                        .. "have died that day.")
                npc_say(npc, ch, "",
                        "However, the scorpions poison caused a bad fever and once "
                        .. "Hasan had recovered from that, he was even more "
                        .. "malicious than before.")
                npc_message(npc, ch, "She sighs.")
                chr_set_quest(ch, "tutorial_hasan", "hate scorpion")
            elseif choice == 2 then
                explain(npc, ch)
            end
        else
            local choice = npc_choice(npc, ch,
                                      "Yes, could you explain about...",
                                      "No, thanks.")
            if choice == 1 then
                explain(npc, ch)
            end
        end
    end
end
