function love.load()
    wf = require 'libraries/windfield'
    world = wf.newWorld(0, 100)

    anim8 = require 'libraries/anim8'

    player = {}
    player.collider = world:newRectangleCollider(100, 100, 32, 32)
    player.collider:setFixedRotation(true)
    player.x = 100
    player.y = 100
    player.sprite = love.graphics.newImage('sprites/placeholder.png')
end

function love.update(dt)
    world:update(dt)
    player.x = player.collider:getX()
    player.y = player.collider:getY()
end

function love.draw()
    world:draw()
    love.graphics.draw(player.sprite, player.x, player.y, nil, nil, nil, 16, 16)
end

--function love.keypressed(key)
    --if key == 'space' then
        --player:applyLinearImpulse(0, -5000)
    --end
--end