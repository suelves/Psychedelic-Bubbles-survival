

Vector2D = {}

function Vector2D:new(xi, yi)
	vector = {
		x = xi or 0,
		y = yi or 0
	}

	self.__index = self
	return setmetatable(vector, self)
end


function Vector2D:add( x, y )
	self.x = self.x + x
	self.y = self.y + y
end

