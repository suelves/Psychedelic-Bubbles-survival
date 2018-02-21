require "core/tools/Vector2D"


function create_enemies( num_enemies )

	enemies = {}
	for i = 0, num_enemies do
		enemies[ i ] = Enemy:new( 
			Vector2D:new(
				love.math.random(0, love.graphics.getWidth()), love.math.random(0, love.graphics.getHeight())
			), Vector2D:new(
				love.math.random(0, 100),
				love.math.random(0, 100)
			),
			love.math.random(0, 50)
		)

		enemies[ i ].velocity = Vector2D:new( love.math.random(-5, 5), love.math.random(-5, 5))
		enemies[ i ].acceleration = Vector2D:new( love.math.random(-1.5, 1.5), love.math.random(-1.5, 1.5))
		enemies[ i ].red = love.math.random(0, 255)
		enemies[ i ].green = love.math.random(0, 255)
		enemies[ i ].blue = love.math.random(0, 255)
		print(enemies[i].acceleration.x, enemies[i].acceleration.y)
	end

	return enemies
end