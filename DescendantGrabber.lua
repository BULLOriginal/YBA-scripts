getgenv().DESCENDANTCAPTURE = false
--false
--true
wait(0.5)
getgenv().DESCENDANTCAPTURE = true


local function printSecondGenerationChildren(instance)

end




local Event
local thread = spawn(function()
	while(wait(0.1)) do
		if getgenv().DESCENDANTCAPTURE == false then
			Event:Disconnect()
			Event = nil
			print("SCRIPT STOP")
			break
		end
	end
end)
Event = game:GetService("Workspace").Living['bowjvaleriy'].DescendantAdded:Connect(printSecondGenerationChildren)
