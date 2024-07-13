if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

function GetPlayerFromId(source)
    return ESX.GetPlayerFromId(source)
end

function GetPlayerFromIdentifier(identifier)
    return ESX.GetPlayerFromIdentifier(identifier)
end

function GetPlayerIdentifier(source)
    local player = GetPlayerFromId(source)
    return player?.identifier
end

function GetJobName(source)
    local player = GetPlayerFromId(source)
    return player.getJob().name
end

function GetPlayerSource(player)
    return player?.source
end

function GetJobs()
    return ESX.GetJobs()
end