require "scripts/npcs"
require "scripts/npcs/Tulimshar_suburbs_indoor/sorfina"
require "scripts/npcs/Tulimshar_suburbs_indoor/chest"

atinit(function()
    local sorfina_posX = 28.5 * TILESIZE
    local sorfina_posY = 26.5 * TILESIZE
    local sorfina =
        npc_create("Sorfina", npc.old_woman, GENDER_FEMALE, sorfina_posX,
                   sorfina_posY, sorfina_talk)

    local function welcome(being, _)
        if being_type(being) == TYPE_CHARACTER then
            if chr_try_get_quest(being, "tutorial_progress") == "" then
                being_say(sorfina, "Ah, you woke up. Come here...")
            end
        end
    end
    local sorfina_trigger_distance = 1.5 * TILESIZE
    trigger_create(sorfina_posX - sorfina_trigger_distance, 23 * TILESIZE,
                   2 * sorfina_trigger_distance, 8 * TILESIZE, welcome, 0, true)

    local function step_on_carpet(being, _)
        if being_type(being) == TYPE_CHARACTER then
            if chr_try_get_quest(being,
                                 "tutorial_progress") == "walk to carpet" then
                being_say(sorfina, "Very good! Come here again...")
                chr_set_quest(being, "tutorial_progress", "steped on carpet")
            end
        end
    end
    trigger_create(32 * TILESIZE, 26 * TILESIZE, 3 * TILESIZE, 3 * TILESIZE,
                   step_on_carpet, 0, true)

    npc_create("Chest", npc.chest, GENDER_UNSPECIFIED, 27.5 * TILESIZE,
               23.5 * TILESIZE, chest_talk)

    local function out(being, _)
        if being_type(being) == TYPE_CHARACTER then
            if chr_try_get_quest(being, "tutorial_door") == "can out" then
                chr_warp(being, "Tulimshar_suburbs", 63.5 * TILESIZE, 77 * TILESIZE)
            else
                chat_message(being,
                             "You're not ready to leave. Go talk to Sorfina.")
            end
        end
    end
    trigger_create(44 * TILESIZE, 31 * TILESIZE, TILESIZE, TILESIZE, out, 0,
                   true)

    npc_create("Tanisha", npc.little_blue_haired_girl, GENDER_FEMALE,
               37.5 * TILESIZE, 90.5 * TILESIZE, nil)
end)
