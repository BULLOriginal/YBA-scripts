local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib("Name", "RJTheme3") 
local Tab = Window:NewTab("TabName")
local Section = Tab:NewSection("Section Name")

local GlobRotation
Section:NewToggle("Toggle body Rotation", "", function(Rotation)
    GlobRotation = Rotation
	local normal = game:GetService("Workspace").Living.geniy2271.LowerTorso.Rotation
    if GlobRotation then
        print("GlobRotation is On")
    end
    while GlobRotation do
		if (not GlobRotation) then
			-- game:GetService("Workspace").Living.geniy2271.LowerTorso.Rotation = normal
			print("GlobRotation is Off")
			break
		end
		for i,v in pairs(game:GetService("Workspace").Living.geniy2271:GetChildren()) do
			if hasProperty(v, "Rotation") then
				v.Rotation =
				v.Rotation + Vector3.new(0, 1, 0)
			end
		end
		wait(0.1)
    end
end)

function hasProperty(object, propertyName)
    local success, _ = pcall(function() 
        object[propertyName] = object[propertyName]
    end)
    return success
end