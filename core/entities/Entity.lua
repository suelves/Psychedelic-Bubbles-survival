require "core/tools/Vector2D"

Entity = {}


function Entity:new(position, dimensions, R)
	Entity = {
		position = position or Vector2D:new(0, 0),
		dimensions = dimensions or Vector2D:new(0, 0),
		R = R or 10,
		red = 0,
		green = 0,
		blue = 0,
		velocity = 5
		
	}
	self.__index = self
	return setmetatable(Entity, self)
end

function Entity:render()
	love.graphics.rectangle("line", self.position.x, self.position.y, self.dimensions.w, self.dimensions.h)
end
