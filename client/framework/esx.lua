if Config.Framework ~= 'esx' then
    return
end

ESX = exports['es_extended']:getSharedObject()

function GetPlayerData()
    return ESX.GetPlayerData()
end

function GetPlayers()
    return ESX.Game.GetPlayers()
end

function GetPlayerIdentifier()
    return GetPlayerData().identifier
end

function GetJobName()
    return GetPlayerData()?.job?.name or 'unemployed'
end

function GetJobGrade()
    return GetPlayerData()?.job?.grade or 0
end