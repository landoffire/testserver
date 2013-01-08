on_character_login(function(ch)
    chr_request_quest(ch, "tutorial_progress", function(ch, var, value) end)
    chr_request_quest(ch, "tutorial_door", function(ch, var, value) end)
end)
