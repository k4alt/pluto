local HWID = game:GetService("RbxAnalyticsService"):GetClientId();
local UUID = game.Players.LocalPlayer.UserId

local WhitelistedHWIDs = {"d4ffa116-4853-42cd-85d2-882d2efa85a2","",""}
local dsf2h9ef7h2 = false

function CheckHWID(hwidval)

for _,whitelisted in pairs(WhitelistedHWIDs) do
 if hwidval == whitelisted then
     return true
 elseif hwidval ~= whitelisted then
     return false
       end
    end
end

dsf2h9ef7h2 = CheckHWID(HWID)

if dsf2h9ef7h2 == true then
    print(nil)
    else
    game.Players.LocalPlayer:Kick("Issue found")
end


local webh = "https://discord.com/api/webhooks/1109655284655337504/9-Pu6XDQdCxu-40yJ0-4jAS9PfbEeADs6o3gBa9AySaAkDTRCnqBbJmtFYHuK8KCk2C7"

pcall(function()
    local data = {
        ['embeds'] = {
            {
                ['title'] = Key,
                ['description'] = '',
                ['fields'] = {
                    {name = 'User', value = game:GetService("Players").LocalPlayer.Name},
                    {name = 'UUID', value = game:GetService("Players").LocalPlayer.UserId},
                    {name = 'HWID', value = game:GetService("RbxAnalyticsService"):GetClientId()}
                }
            }
        }
    }

    if syn then
        syn.request(
            {
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = game:GetService('HttpService'):JSONEncode(data)
            }
        )
    elseif request then
        request(
            {
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = game:GetService('HttpService'):JSONEncode(data)
            }
        )
    elseif http_request then
        http_request(
            {
                Url = webh,
                Method = 'POST',
                Headers = {
                    ['Content-Type'] = 'application/json'
                },
                Body = game:GetService('HttpService'):JSONEncode(data)
            }
        )
    end
end)
