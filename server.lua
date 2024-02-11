local QBCore = exports['qb-core']:GetCoreObject()
local commandCooldowns = {}

if Config.CleanAuto then
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.CleanCooldown)
            TriggerClientEvent("chat:clear", -1)
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(17, 153, 153);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
                args = {"CHAT", "Chat was automatically cleared"},
                multiline = true
            })
    end
end)
end

-- // COMMAND TO CLEAR SOURCE CHAT // --
RegisterCommand("clear", function(source, args, rawCommand)
    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()
        TriggerClientEvent("chat:clear", source)
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(17, 153, 153);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
            args = {"CHAT ", "You cleared your chat"},
            multiline = true
        })
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)

-- // COMMAND TO CLEAR SERVER CHAT // --
RegisterCommand("clearall", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)
    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()
        TriggerClientEvent("chat:clear", -1)
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(17, 153, 153);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
            args = {"CHAT", "The chat was cleaned by " .. string.upper(Player.PlayerData.name)},
            multiline = true
        })
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, "admin")

-- // COMMAND TO SEND A STAFF ANNOUNCE // --
RegisterCommand("staffannounce", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(221, 127, 4);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
            args = {"STAFF " .. string.upper(Player.PlayerData.name), table.concat(args, ' ')},
            multiline = true
        })
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, "admin")

-- // COMMAND TO SEND A POLICE ANNOUNCE // --
RegisterCommand("policeannounce", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()

        if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "sheriff" then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(3, 39, 201);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
                args = {"LSPD", table.concat(args, ' ')},
                multiline = true
            })
        else
            TriggerClientEvent('QBCore:Notify', source, "You don't have Permission", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)

-- // COMMAND TO SEND A EMS ANNOUNCE // --
RegisterCommand("emsannounce", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()

        if Player.PlayerData.job.name == "ambulance" then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(173, 11, 11);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
                args = {"EMS", table.concat(args, ' ')},
                multiline = true
            })
        else
            TriggerClientEvent('QBCore:Notify', source, "You don't have Permission", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)

-- // COMMAND TO SEND A MECHANIC ANNOUNCE // --
RegisterCommand("mecannounce", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()

        if Player.PlayerData.job.name == "mechanic" then
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(173, 103, 11);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
                args = {"MECHANIC", table.concat(args, ' ')},
                multiline = true
            })
        else
            TriggerClientEvent('QBCore:Notify', source, "You don't have Permission", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)

-- // COMMAND TO SEND AN ANNOUNCE (BY PAYING) // --
RegisterCommand("announce", function(source, args, rawCommand)
    local Player = QBCore.Functions.GetPlayer(source)
    local PlayerBank = Player.Functions.GetMoney("bank")

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()

        if PlayerBank >= 100 then
            Player.Functions.RemoveMoney("bank", 100)
            TriggerClientEvent('chat:addMessage', -1, {
                template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(12, 92, 19);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
                args = {string.upper(Player.PlayerData.charinfo.firstname) .. " " ..
                    string.upper(Player.PlayerData.charinfo.firstname) .. " ANNOUNCE's", table.concat(args, ' ')},
                multiline = true
            })
        else
            TriggerClientEvent('QBCore:Notify', source, "You need $100 to pay for the announce", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)

-- // COMMAND TO TALK IN ANON // --
RegisterCommand("anon", function(source, args, rawCommand)

    if args[1] == "" or args[1] == nil then
        return TriggerClientEvent('QBCore:Notify', source, "You need to write something..", "error")
    end

    if not commandCooldowns[source] or (os.time() - commandCooldowns[source]) >= Config.Cooldowns then
        commandCooldowns[source] = os.time()

        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div class="container-msg"><span class="heading"><span class="plname" style="background-color:rgb(66, 66, 66);">{0}</span><div class="qblg"></div></span><span class="second-text">{1}</span></div>',
            args = {"ANON", table.concat(args, ' ')},
            multiline = true
        })
    else
        TriggerClientEvent('QBCore:Notify', source, "Command cooldown: Wait 2 seconds", "error")
    end
end, false)
