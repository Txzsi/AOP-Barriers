local aop = config.setup.default_aop


RegisterNetEvent('get:aop')
AddEventHandler('get:aop', function ()
    TriggerClientEvent('returned:aop', source, aop)
end)

RegisterCommand('aop', function(source, args, message)
    if IsPlayerAceAllowed(source, allowedace) then
        local length = string.len(table.concat(args, " "));
        if (length > 0) then
            aop = table.concat(args, " ")
            TriggerClientEvent("AOPCHANGE", -1, table.concat(args, " "))
            TriggerClientEvent("chatMessage", -1, 'The AOP has changed to ' .. table.concat(args, " ") .. '.')
        else
            TriggerClientEvent('chatMessage', source, "^1 Access Denied")
        end
    else
        TriggerClientEvent('chatMessage', source, "^1 AOP location text is to short.")
    end
end)
