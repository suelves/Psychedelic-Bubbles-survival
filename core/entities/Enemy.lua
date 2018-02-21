
require "core/tools/Vector2D"

Enemy = {}

Enemy = Entity:new()
Enemy.velocity = Vector2D:new(0, 0)
Enemy.acceleration = Vector2D:new(0, 0)

function Enemy:render()
	love.graphics.setColor(self.red, self.green, self.blue)
	love.graphics.circle("fill", self.position.x, self.position.y, self.R)
end


function Enemy:update()
	-- add movement to enemt
	self.position.x = self.position.x + (self.velocity.x * self.acceleration.x)
	self.position.y = self.position.y + (self.velocity.y * self.acceleration.y)

	-- out of screen
	if self.position.x < -self.R then
		self.position.x = love.graphics.getWidth() - self.R
		self.velocity = Vector2D:new(love.math.random(-5, 5), self.velocity.y )
	elseif self.position.y < -self.R then
		self.position.y = love.graphics.getHeight() - self.R
		self.velocity = Vector2D:new(self.velocity.x, love.math.random(-5, 5))
	elseif self.position.x > love.graphics.getWidth() + self.R then
		self.velocity = Vector2D:new(love.math.random(-5, 5), self.velocity.y )
		self.position.x = self.R
	elseif self.position.y > love.graphics.getHeight() + self.R then
		self.velocity = Vector2D:new(self.velocity.x, love.math.random(-5, 5))
		self.position.y = self.R

	end

	if self.velocity.x == 0 and self.velocity.y == 0 then
		self.velocity = Vector2D:new(1, 1)
	end
end