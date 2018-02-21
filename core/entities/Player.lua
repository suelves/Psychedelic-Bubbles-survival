require "core/tools/Vector2D"

Player = {}

Player = Entity:new()


function Player:render()
	love.graphics.circle("fill", self.position.x, self.position.y, self.R)
	
end

function Player:intersects(enemy)
    local dist = (self.position.x - enemy.position.x)^2 + (self.position.y - enemy.position.y)^2
    return dist <= (self.R + enemy.R)^2
end
