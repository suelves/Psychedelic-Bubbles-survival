
require "core/tools/Vector2D"
require "core/entities/Entity"
require "core/entities/Player"
require "core/entities/Enemy"
require "core/scenes/Intro"
require "core/scenes/Stage"
require "core/scenes/GameOver"
require "core/data/configuration"



GAME_SCENE = {}
CURRENT_GAME_SCENE = {}
SCORE = nil
keypressed = {}
function love.load()
	love.window.setFullscreen(true, "desktop")
	
	-- GLOBAL OBJECTS
	GAME_SCENE["intro"] = Intro:new()
	GAME_SCENE["stage"] = Stage:new()
	GAME_SCENE["gameover"] = GameOver:new()
	CURRENT_GAME_SCENE = GAME_SCENE["intro"]
	
	big_font = love.graphics.newFont("assets/fonts/game_over.ttf", 100)
	love.graphics.setFont(big_font)
	
	normal_font = love.graphics.newFont("assets/fonts/game_over.ttf", 50)
	-- love.graphics.setFont(font)
end



function love.update(dt)
	CURRENT_GAME_SCENE:input( keypressed )
	CURRENT_GAME_SCENE:update()
end


function love.draw()
	 CURRENT_GAME_SCENE:render()
end

-- EVENTS
function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	else
		keypressed[key] = true
	end
end


function love.keyreleased(key)
		keypressed[key] = nil
end




