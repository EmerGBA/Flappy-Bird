function love.load()
    wf = require 'libraries/windfield'
    world = wf.newWorld(0, 1000)

    anim8 = require 'libraries/anim8'
    love.graphics.setDefaultFilter('nearest', 'nearest')

    gameState = 1
    score = 0

    player = {}
    player.collider = world:newRectangleCollider(100, 100, 32, 32)
    player.collider:setFixedRotation(true)
    player.x = 100
    player.y = 100
    player.sprite = love.graphics.newImage('sprites/placeholder.png')

    pipe1 = {}
    pipe1.sprite = love.graphics.newImage('sprites/placeholder_pipe.png')
    pipe1.x = 900
    pipe1.y = love.math.random(-550, -200)
    pipe1.speed = 7
    --pipe1.collider = world:newRectangleCollider(pipe1.x, pipe1.y, 80, 600)
    --pipe1.collider:setFixedRotation(true)
    --pipe1.collider:setType('static')

    pipe2 = {}
    pipe2.sprite = love.graphics.newImage('sprites/placeholder_pipe.png')
    pipe2.x = 900
    pipe2.y = pipe1.y + 750
    pipe2.speed = 7
end

function love.update(dt)
    world:update(dt)

    local vx = pipe1.speed
    local vy = 0

    player.x = player.collider:getX()
    player.y = player.collider:getY()

    --pipe1.collider:setLinearVelocity(vx, vy)

    --pipe1.x = pipe1.collider:getX()
    --pipe1.y = pipe1.collider:getY()

    pipe1.x = pipe1.x - pipe1.speed
    pipe2.x = pipe2.x - pipe2.speed
end

function love.draw()
    world:draw()
    love.graphics.draw(player.sprite, player.x, player.y, nil, nil, nil, 16, 16)
    love.graphics.draw(pipe1.sprite, pipe1.x, pipe1.y)
    love.graphics.draw(pipe2.sprite, pipe2.x, pipe2.y)

    --This line prints the score variable to the screen but it looks awful so I'll fix that later.
    --love.graphics.print(score, 375, 25, nil, 6)
end

function love.mousepressed(x, y, button, istouch)
    if button == 1  and gameState == 1 then
        player.collider:setLinearVelocity(0, 0)
        player.collider:applyLinearImpulse(0, -1100)
    end
end
