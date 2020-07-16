-- Globals
mouse = {}
circle = {}
arrowImg = {}

function love.load(arg)
    arrowImg = love.graphics.newImage('assets/arrow.png')
    circle.x = 300
    circle.y = 300

    circle.speed = 350
end


function love.update(dt)
    mouse.x, mouse.y = love.mouse.getPosition()  -- This gets the x and y coordinates of the mouse and assigns those to these respectively.
    -- cursor = love.mouse.newCursor(arrowImg, 0, 0)
    if (circle.x ~= mouse.x and circle.y ~= mouse.y) then
        angle = math.atan2(circle.x - mouse.x, circle.y - mouse.y) * -1 
    end
    if circle.x < mouse.x then
        circle.x = circle.x + (circle.speed * 2.5 * dt)
    end
    if circle.x > mouse.x then
        circle.x = circle.x - (circle.speed * 2.5 * dt)
    end
    if circle.y < mouse.y then
        circle.y = circle.y + (circle.speed * 2.5 * dt)
    end
    if circle.y > mouse.y then
        circle.y = circle.y - (circle.speed * 2.5 * dt)
    end


    -- Exit the game
    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end


end

function love.draw(dt)
    love.graphics.setColor(255, 0, 0)
    love.graphics.circle("fill", circle.x, circle.y, 50)
    love.graphics.setColor(255, 255, 255)
    love.graphics.setBackgroundColor(255, 255, 255)
    love.graphics.draw(arrowImg, circle.x, circle.y, angle, .5, .5, 120, 350)
    love.mouse.setVisible(false)
    -- Debug text for coordinates
    -- love.graphics.print("Mouse Coordinates: " .. mouse.x .. ", " .. mouse.y)
    -- Debug text for angle
    -- love.graphics.print("\nVector Angle: " ..  math.deg( angle ))
end

