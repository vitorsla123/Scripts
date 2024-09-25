loadstring(game:HttpGet(("https://raw.githubusercontent.com/REDzHUB/LibraryV2/main/redzLib")))()
MakeWindow({
  Hub = {
    Title = "Esp",
    Animation = "by onlyistemporaly"
  },
  Key = {
    KeySystem = true,
    Title = "Key System",
    Description = "",
    KeyLink = "",
    Keys = {"FreeEsp"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})

local Main = MakeTab({Name = "Esp"})




local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false
ESP.Tracers = false
ESP.Boxes = false
ESP.Names = false
ESP.TeamColor = false
ESP.TeamMates = false



local Toggle = AddToggle(Main, {
  Name = "Enable",
  Default = false,
  Callback = function(Value)
    ESP.Players = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "Name",
  Default = false,
  Callback = function(Value)
    ESP.Names = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "Box",
  Default = false,
  Callback = function(Value)
    ESP.Boxes = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "Tracer",
  Default = false,
  Callback = function(Value)
    ESP.Tracers = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "Team check",
  Default = false,
  Callback = function(Value)
    ESP.TeamColor = Value
  end
})


local Toggle = AddToggle(Main, {
  Name = "Team color",
  Default = false,
  Callback = function(Value)
ESP.TeamMates = Value
  end
})


AddColorPicker(Main, {
  Name = "Color",
  Default = Color3.fromRGB(255, 255, 0),
  Callback = function(Value)
    ESP.Color = Value
  end
})

local Main = MakeTab({Name = "Aimbot"})



local Toggle = AddToggle(Main, {
  Name = "Enable",
  Default = false,
  Callback = function(--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local fov = 100
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(128, 0, 128) -- Purple color
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
  end
})
