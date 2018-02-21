require "core/tools/create_enemies"

Stage = {}


function Stage:new()
	Stage = {
		player = Player:new(
			Vector2D:new( love.window.getWidth() / 2, love.window.getHeight() / 2),
			Vector2D:new(32, 32),
			15
		),
		max_enemies = 10,
		enemies_flag = true,
		enemies = create_enemies(10),
		start_time = love.timer.getTime(),
		RED = love.math.random(0, 255),
		GREEN = love.math.random(0, 255),
		BLUE = love.math.random(0, 255)
	
	}

	self.__index = self
	return setmetatable(Stage, self)
end

function Stage:render()
	self.player:render()

	for i = 1, #self.enemies do		
		self.enemies[i]:render()
	end
	love.graphics.setFont(big_font)
	love.graphics.print("Score: " .. tostring(SCORE), 20, 30)
end

function Stage:input( keypressed )
	
	if keypressed["w"] and keypressed["d"] then
		self.player.position:add(self.player.velocity, -self.player.velocity)
	elseif keypressed["d"] and keypressed["s"] then
		self.player.position:add(self.player.velocity, self.player.velocity)
	elseif keypressed["s"] and keypressed["a"] then
		if self.RED > 0 then self.RED =  self.RED - 1 end
		self.player.position:add(-self.player.velocity, self.player.velocity)
	elseif keypressed["a"] and keypressed["w"] then
		if self.RED < 255 then self.RED =  self.RED + 1 end
		self.player.position:add(-self.player.velocity, -self.player.velocity)
	elseif keypressed["w"] then
		if self.GREEN < 255 then self.GREEN =  self.GREEN + 1 end
		self.player.position:add(0, -self.player.velocity)
	elseif keypressed["d"] then
		if self.GREEN > 0 then self.GREEN =  self.GREEN - 1 end
		self.player.position:add(self.player.velocity, 0)
	elseif keypressed["s"] then
		if self.BLUE < 255 then self.BLUE =  self.BLUE + 1 end
		self.player.position:add(0, self.player.velocity)
	elseif keypressed["a"] then
		if self.BLUE > 0 then self.BLUE =  self.BLUE - 1 end
		self.player.position:add(-self.player.velocity, 0)
	end

end

function Stage:update()
	love.graphics.setBackgroundColor(self.RED, self.GREEN, self.BLUE)
	SCORE = math.floor(love.timer.getTime() - self.start_time)
	
	for i = 1, #self.enemies do
		self.enemies[i]:update()
	
		-- detectar colisions
		if self.player:intersects(self.enemies[i]) then
			CURRENT_GAME_SCENE = GAME_SCENE["gameover"]
		end
	end


end

