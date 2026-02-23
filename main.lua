local getinfo = getinfo or debug.getinfo local DEBUG = false local Hooked = {} local Detected, Kill setthreadidentity(2) 

--[[
    SKIP PAST THIS TO THE OTHER NOTE
    (this is a adonis disabler thing btw)
]]

for i, v in getgc(true) do if typeof(v) == "table" then local DetectFunc = rawget(v, "Detected") local KillFunc = rawget(v, "Kill") if typeof(DetectFunc) == "function" and not Detected then Detected = DetectFunc local Old; Old = hookfunction(Detected, function(Action, Info, NoCrash) if Action ~= "_" then     if DEBUG then         warn(`Adonis AntiCheat flagged\nMethod: {Action}\nInfo: {Info}`)     end end return true end) table.insert(Hooked, Detected) end if rawget(v, "Variables") and rawget(v, "Process") and typeof(KillFunc) == "function" and not Kill then Kill = KillFunc local Old; Old = hookfunction(Kill, function(Info)     if DEBUG then         warn(`Adonis AntiCheat tried to kill (fallback): {Info}`)     end end) table.insert(Hooked, Kill) end end end

local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
 local LevelOrFunc, Info = ...  if Detected and LevelOrFunc == Detected then     if DEBUG then         warn(`Adonis AntiCheat sanity check detected and broken`)     end      return coroutine.yield(coroutine.running()) end  return Old(...)
end))

--=========================================================--

task.wait(1) game:GetService("ReplicatedFirst").LocalScript.Disabled = true
local v1 = game:GetService("ReplicatedStorage") local v_u_2 = game:GetService("Stats") local v_u_3 = game:GetService("UserInputService") local v_u_4 = game:GetService("GuiService") local v_u_5 = game:GetService("TextService") local v6 = game:GetService("RunService") local v7 = v1:WaitForChild("meow") local v_u_8 = v1:WaitForChild("nya") local v_u_9 = 0 local v_u_10 = os.clock() local v_u_11 = 0
v6.PreRender:Connect(function()    v_u_9 = v_u_9 + 1    local v12 = os.clock()    if v12 - v_u_10 >= 1 then        v_u_11 = v_u_9        v_u_9 = 0        v_u_10 = v12    end end)

--[[
    dont edit the "token?" i think its to make sure the requests are real but yk
    should be able to figure out the rest

    EDIT THE STUFF BELOW THIS TO CHANGE DISPLAYED STUFF
]]

    v7.OnClientEvent:Connect(function(p13) if type(p13) == "table" then if p13.t == "device" then local v14 = p13.token if type(v14) == "number" then local v15 = v_u_5:GetTextSize(utf8.char(65535), 16, "SourceSans", Vector2.one * 1000) local v16 = v_u_5:GetTextSize(utf8.char(63743), 16, "SourceSans", Vector2.one * 1000) local v17 = v_u_8 local v18 = {
["t"] = "device",
["token"] = p13.token,
["tbl"] = {
    ["A"] = v_u_3.VREnabled,
    ["B"] = v_u_4:IsTenFootInterface(),
    ["C"] = v_u_4.IsWindows,
    ["D"] = getfenv().version(),
    ["E"] = v_u_3.GyroscopeEnabled or v_u_3.AccelerometerEnabled,
    ["F"] = v_u_3.TouchEnabled,
    ["G"] = v_u_3.KeyboardEnabled,
    ["H"] = v_u_3.MouseEnabled,
    ["I"] = v15 ~= v16
} 
    } v17:FireServer(v18) return end end if p13.t == "metrics" then local v19 = p13.token if type(v19) == "number" then v_u_8:FireServer({
["t"] = "metrics",
["token"] = p13.token,
["fps"] = v_u_11,
["gfx"] = UserSettings():GetService("UserGameSettings").SavedQualityLevel,
["mem"] = v_u_2:GetTotalMemoryUsageMb(),
["res"] = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(0, 0)
    }) end end end end)
