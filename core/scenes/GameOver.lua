

GameOver = {}


function GameOver:new()
	GameOver = {
		scene_name = 'GameOver'
	}
	self.__index = self
	return setmetatable(GameOver, self)
end

function GameOver:render()
	love.graphics.setFont(big_font)
	title_width = big_font:getWidth("Game Over")
	love.graphics.print("Game Over", (love.window.getWidth() / 2) - title_width / 2, love.window.getHeight() / 2)
	love.graphics.setFont(normal_font)
	
	subtitle_width = normal_font:getWidth("You survived " .. SCORE .. " seconds")
	love.graphics.print("You survived " .. SCORE .. " seconds", (love.window.getWidth() / 2) - subtitle_width / 2, (love.window.getHeight() / 2) + 60)

end

function GameOver:update()

end

function GameOver:input( pressedkey)
	
	if pressedkey[" "]  then
		print(keypressed)
		GAME_SCENE["stage"] = Stage:new()
		CURRENT_GAME_SCENE = GAME_SCENE["stage"]
	end
end

