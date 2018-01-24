function win(s) -- Announces win?
    if s == "l" then
        -- Left wins
    else
        -- Right wins
    end
    time = 0 -- Reset game
    bullets.reset()
end

function love.load()
    require "values"
    bullets = require "bullets"
    draw = require "draw"
    time = 0 -- Time since start
    bullets.reset()
    love.window.setMode(w, h)
end

function love.keypressed(key, scancode, isrepeat)
    if not isrepeat then
        if scancode == "z" then
            bullets.bullet(1, 0, "l")
        elseif scancode == "x" then
            bullets.bullet(2, 0, "l")
        elseif scancode == "c" then
            bullets.bullet(3, 0, "l")
        elseif scancode == "," then
            bullets.bullet(1, 0, "r")
        elseif scancode == "." then
            bullets.bullet(2, 0, "r")
        elseif scancode == "/" then
            bullets.bullet(3, 0, "r")
        end
    end
end

function love.update(dt)
    time = time + dt -- Update timer
    bullets.update(dt)
end

function love.draw()
    for k, v in pairs(lb) do
        love.graphics.origin()
        love.graphics.translate(v.d + 50, v.h * 100)
        draw.bullet(lcol)
    end
    for k, v in pairs(rb) do
        love.graphics.origin()
        love.graphics.translate(w - 50 - v.d, v.h * 100)
        love.graphics.scale(-1, 1)
        draw.bullet(rcol)
    end
end
