getgenv().Config = {
    ["Team"] = "Pirates", --// Marines, Pirates
    ["Webhook"] = {
        ["Enable"] = false, --// Enable if you have Webhook Url
        ["Url"] = "" --// Your webhook url
    },
    ["Skip"] = {
        ["V4"] = true, --// Skip V4
        ["Fruit"] = { --// Skip Fruit
            "Leopard-Leopard",
            "Venom-Venom",
            "Dough-Dough",
            "Portal-Portal"
        }
    },
    ["Chat"] = {
        ["Enable"] = false, --// Enable Chat
        ["Content"] = {"Hello me use BielHub Auto Bounty"} --// Content
    },
    ["Misc"] = {
        ["Hide If Low Health"] = true, --// Run
        ["Hide Health"] = {4000,5500}, --// Health for run
        ["Lock Camera"] = true, --// Lock Cam to target
        ["FPS Boost"] = false, --// Booster FPS
        ["White Screen"] = false, --// White Screen
        ["Bypass TP"] = true, --// Bypass TP 1 -> 2 hit
        ["Spam All Skill On V4"] = true, --// If you have v4, warn: change your weapon setting
        ["Gun Method"] = false --// Enable if you use gun
    },
    --//  Next
    ["Weapons"] = {
        ["Melee"] = {
            ["Enable"] = true,
            ["Delay"] = 2.5,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0.1},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0.1},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["V"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        ["Blox Fruit"] = {
            ["Enable"] = false,
            ["Delay"] = 3,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["C"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["V"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["F"] = {["Enable"] = false, ["HoldTime"] = 0}
            }
        },
        --// Copy Next
        ["Sword"] = {
            ["Enable"] = true,
            ["Delay"] = 1.5,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 1},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
            }
        },
        ["Gun"] = {
            ["Enable"] = true,
            ["Delay"] = 1.2,
            ["Skills"] = {
                ["Z"] = {["Enable"] = true, ["HoldTime"] = 0},
                ["X"] = {["Enable"] = true, ["HoldTime"] = 0}
            }
        }
    }
}
repeat wait() until game:IsLoaded()
local function createSkipButton()
    local skipButton = Instance.new("TextButton")
    skipButton.Size = UDim2.new(0, 100, 0, 50)
    skipButton.Position = UDim2.new(0.5, -50, 0.5, -25)
    skipButton.BackgroundColor3 = Color3.new(1, 1, 1)
    skipButton.Text = "SKIP"
    skipButton.Font = Enum.Font.SourceSans
    skipButton.TextSize = 20
    skipButton.Parent = game.CoreGui

    skipButton.MouseButton1Click:Connect(function()
        local currentTarget = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position
        local closestPlayer = nil
        local closestDistance = math.huge

        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer then
                local distance = (player.Character.HumanoidRootPart.Position - currentTarget).magnitude
                if distance < closestDistance then
                    closestPlayer = player
                    closestDistance = distance
                end
            end
        end

        if closestPlayer then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentTarget, closestPlayer.Character.HumanoidRootPart.Position)
        end
    end)
end

game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.F1 then
        createSkipButton()
    end
end)
