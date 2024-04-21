--reference to the main window and the jump button
jumpWindow = nil
jumpButton = nil


--distance the button will move each call:
moveDist = 10
--delay between each move
moveDelay = 50
--the X position for the button to start after it was pressed:
xStartPos = 270
--the range for where the button can spawn
yMinRange = 25
yMaxRange = 300

function init()
	-- import the .otoi file.
	g_ui.importStyle('jumpaction')
	
	--connect window callbacks.
	connect(g_game, { onJumpWindow = onJumpWindow,
				onGameEnd = destroyWindow})

	--get the instance of this window if one already exists.
	local window = rootWidget:recursiveGetChildById('jumpWindow')
	if window then
		jumpWindow = window
	end
	
end



function terminate()
	--disconnect window callbacks.
	disconnect(g_game, { onJumpWindow = onJumpWindow,
				onGameEnd = destroyWindow})
end

function destroyWindow()
	--destroy this window and reset references.
	if jumpWindow then
		jumpWindow:destroy()
		jumpWindow = nil
		jumpButton = nil
	end
end


function onJumpWindow()
	--return if the window has already been drawn.
	if jumpWindow then
		return
	end

	jumpWindow = g_ui.createWidget('JumpWindow', rootWidget)
	jumpButton = jumpWindow:recursiveGetChildById('jumpButton')
	startButtonMovement()
end



function startButtonMovement()

	--return if the jumpButton reference has not been set.
	if not jumpButton then
		return
	end
	
       	scheduleEvent(function() buttonMove() end, moveDelay)
		
end



function buttonMove()
	--return if the jumpButton reference has not been set.
	if not jumpButton then
		return
	end
	local newX = jumpButton:getMarginLeft() - moveDist
	jumpButton:setMarginLeft(newX)

	if newX < 10 then
		buttonJump()
	end
	
       	scheduleEvent(function() buttonMove() end, moveDelay)
		
end



function buttonJump()
	local newY = math.random(yMinRange, yMaxRange)
	jumpButton:setMarginTop(newY)


	--reset the X position back to the start.
	jumpButton:setMarginLeft(xStartPos)
	
end



function execute(protocol, opcode, buffer)
	if opcode == 99 then
		onJumpWindow()
		
	end
end


--sets "execute" function to run whenever opcode 99 is recieved.
ProtocolGame.registerExtendedOpcode(99, execute)








