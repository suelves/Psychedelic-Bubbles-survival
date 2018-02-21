

Intro = {}


function Intro:new()
	Intro = {
		scene_name = 'intro',
		RED = love.math.random(0, 255),
		GREEN = love.math.random(0, 255),
		BLUE = love.math.random(0, 255),
		first_time = true

	}
	self.__index = self
	return setmetatable(Intro, self)
end

function Intro:render()
	love.graphics.setFont(big_font)
	title_width = big_font:getWidth(config["title"])
	love.graphics.print(config["title"], (love.window.getWidth() / 2) - title_width / 2, love.window.getHeight() / 2)
	love.graphics.setFont(normal_font)
	subtitle_width = normal_font:getWidth("press spacebar")
	love.graphics.print("press spacebar", (love.window.getWidth() / 2) - subtitle_width / 2, (love.window.getHeight() / 2) + 40)


	-- debug info
	if config["debug"] then
	love.graphics.print("version: " .. config["version"], (love.window.getWidth() - 400), (love.window.getHeight()) - 100)

	end
end

function Intro:update()
	if self.first_time then
		love.graphics.setBackgroundColor(self.RED, self.GREEN, self.BLUE)
		self.first_time = false
	end
end

function Intro:input( pressedkey)
	
	if pressedkey[" "]  then
		print(keypressed)
		CURRENT_GAME_SCENE = GAME_SCENE["stage"]
	end
end

