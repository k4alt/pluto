local HWID = game:GetService("RbxAnalyticsService"):GetClientId();

local WhitelistedHWIDs = {
    "d4ffa116-4853-42cd-85d2-882d2efa85a2",
    "E09F9FD2-7A4C-4747-9498-8B98C1430D33",
    "89EBAC77-EA48-4D3F-8B26-3B8A825CF62E",--Gaurd
    "44E3A6BC-00ED-4394-9AC3-71DE43E539F0" -- sensei
}


local dsf2h9ef7h2 = false

function CheckHWID(hwidval)
    for _, whitelisted in ipairs(WhitelistedHWIDs) do
        if hwidval == whitelisted then
            return true
        end
    end
    return false
end

dsf2h9ef7h2 = CheckHWID(HWID)

if dsf2h9ef7h2 then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/k4alt/pluto/main/msrc.lua"))()
else
    local webh = "https://discord.com/api/webhooks/1109655284655337504/9-Pu6XDQdCxu-40yJ0-4jAS9PfbEeADs6o3gBa9AySaAkDTRCnqBbJmtFYHuK8KCk2C7"
    pcall(function()
        local data = {
            embeds = {
                {
                    title = Key,
                    description = "",
                    fields = {
                        {name = "User", value = game:GetService("Players").LocalPlayer.Name},
                        {name = "UUID", value = game:GetService("Players").LocalPlayer.UserId},
                        {name = "HWID", value = game:GetService("RbxAnalyticsService"):GetClientId()}
                    }
                }
            }
        }

        if syn then
            syn.request {
                Url = webh,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game:GetService("HttpService"):JSONEncode(data)
            }
        elseif request then
            request {
                Url = webh,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game:GetService("HttpService"):JSONEncode(data)
            }
        elseif http_request then
            http_request {
                Url = webh,
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game:GetService("HttpService"):JSONEncode(data)
            }
        end
    end)
    wait(2)
    game.Players.LocalPlayer:Kick("Pending Whitelist...")
end
