-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/wyButjTMhM)
-- Decompiled on 2024-11-08 17:00:08
-- Luau version 6, Types version 3
-- Time taken: 0.002441 seconds

local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local VoiceChatService_upvr = game:GetService("VoiceChatService")
local Promise_upvr = require(ReplicatedStorage_upvr:WaitForChild("Modules").Promise)
local function _(arg1) -- Line 8, Named "PromiseIsVoiceEnabled"
	--[[ Upvalues[2]:
		[1]: Promise_upvr (readonly)
		[2]: VoiceChatService_upvr (readonly)
	]]
	return Promise_upvr.spawn(function(arg1_2, arg2) -- Line 9
		--[[ Upvalues[2]:
			[1]: arg1 (readonly)
			[2]: VoiceChatService_upvr (copied, readonly)
		]]
		if arg1 == nil then
			arg2("Invalid UserId")
		end
		local var5_upvw = false
		local pcall_result1_3, pcall_result2 = pcall(function() -- Line 16
			--[[ Upvalues[3]:
				[1]: var5_upvw (read and write)
				[2]: VoiceChatService_upvr (copied, readonly)
				[3]: arg1 (copied, readonly)
			]]
			var5_upvw = VoiceChatService_upvr:IsVoiceEnabledForUserIdAsync(arg1)
		end)
		if pcall_result1_3 then
			arg1_2(var5_upvw)
		else
			arg2(pcall_result2)
		end
	end)
end
local module_upvr = {
	Queue = false;
	GetTradeHubRemote = function(arg1) -- Line 30, Named "GetTradeHubRemote"
		--[[ Upvalues[1]:
			[1]: ReplicatedStorage_upvr (readonly)
		]]
		local TradeHubRemote = ReplicatedStorage_upvr:FindFirstChild("TradeHubRemote")
		if TradeHubRemote then
			return TradeHubRemote
		end
		return nil
	end;
}
function module_upvr.TeleportToRandomServer(arg1) -- Line 41
	--[[ Upvalues[1]:
		[1]: module_upvr (readonly)
	]]
	if module_upvr.Queue then
	else
		local any_GetTradeHubRemote_result1 = module_upvr:GetTradeHubRemote()
		if any_GetTradeHubRemote_result1 then
			module_upvr.Queue = true
			any_GetTradeHubRemote_result1:InvokeServer({
				VoiceChat = false;
			})
			module_upvr.Queue = false
		end
	end
end
local Players_upvr = game:GetService("Players")
function module_upvr.TeleportToVCServer(arg1) -- Line 52
	--[[ Upvalues[4]:
		[1]: module_upvr (readonly)
		[2]: Players_upvr (readonly)
		[3]: Promise_upvr (readonly)
		[4]: VoiceChatService_upvr (readonly)
	]]
	if module_upvr.Queue then
	else
		local any_GetTradeHubRemote_result1_upvr = module_upvr:GetTradeHubRemote()
		if any_GetTradeHubRemote_result1_upvr then
			module_upvr.Queue = true
			local UserId_upvr = Players_upvr.LocalPlayer.UserId
			Promise_upvr.spawn(function(arg1_3, arg2) -- Line 9
				--[[ Upvalues[2]:
					[1]: UserId_upvr (readonly)
					[2]: VoiceChatService_upvr (copied, readonly)
				]]
				if UserId_upvr == nil then
					arg2("Invalid UserId")
				end
				local var17_upvw = false
				local pcall_result1_2, pcall_result2_2 = pcall(function() -- Line 16
					--[[ Upvalues[3]:
						[1]: var17_upvw (read and write)
						[2]: VoiceChatService_upvr (copied, readonly)
						[3]: UserId_upvr (copied, readonly)
					]]
					var17_upvw = VoiceChatService_upvr:IsVoiceEnabledForUserIdAsync(UserId_upvr)
				end)
				if pcall_result1_2 then
					arg1_3(var17_upvw)
				else
					arg2(pcall_result2_2)
				end
			end):Then(function(arg1_4) -- Line 61
				--[[ Upvalues[3]:
					[1]: any_GetTradeHubRemote_result1_upvr (readonly)
					[2]: Players_upvr (copied, readonly)
					[3]: module_upvr (copied, readonly)
				]]
				if arg1_4 then
					any_GetTradeHubRemote_result1_upvr:InvokeServer({
						VoiceChat = true;
					})
				else
					warn("Player does not have voice enabled, do some sort of warning.")
					Players_upvr.LocalPlayer.Character.BindableEvent:Fire("Message", {
						Duration = 5;
						Text = "You do NOT have Voice Chat enabled!";
						Sound = {
							Sound = "Error";
							ClientOnly = true;
						};
					})
				end
				module_upvr.Queue = false
			end):Catch(function(arg1_5) -- Line 75
				--[[ Upvalues[1]:
					[1]: module_upvr (copied, readonly)
				]]
				module_upvr.Queue = false
				warn(arg1_5)
			end)
		end
	end
end
function module_upvr.PromiseOnlineFriends(arg1, arg2) -- Line 82
	--[[ Upvalues[1]:
		[1]: Promise_upvr (readonly)
	]]
	return Promise_upvr.spawn(function(arg1_6, arg2_2) -- Line 83
		--[[ Upvalues[1]:
			[1]: arg2 (readonly)
		]]
		local var27_upvw
		local pcall_result1, pcall_result2_3 = pcall(function() -- Line 86
			--[[ Upvalues[2]:
				[1]: var27_upvw (read and write)
				[2]: arg2 (copied, readonly)
			]]
			var27_upvw = arg2:GetFriendsOnline(200)
		end)
		if not pcall_result1 then
			arg2_2(pcall_result2_3)
		end
		arg1_6(var27_upvw)
	end)
end
return module_upvr
