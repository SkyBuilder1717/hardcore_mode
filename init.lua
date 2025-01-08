local modname = core.get_current_modname()
local S = core.get_translator(modname)

core.register_on_dieplayer(function(ObjectRef, reason)
    local name = ObjectRef:get_player_name()
    if not core.check_player_privs(name, {server=true}) then
        if core.is_singleplayer() then
            xban.ban_player(name, S("Hardcore mode"), nil, S("@n@n@nYou died in hardcore mode!@n(Reason: @1)@n@nYou can only delete this world.", reason.type))
        else
            core.chat_send_all(S("@1 died in hardcore mode!", name))
            xban.ban_player(name, S("Hardcore mode"), nil, S("@n@n@nYou died in hardcore mode!@n(Reason: @1)@n@nR.I.P. you", reason.type))
        end
    end
end)
