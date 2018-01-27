function win(side) -- Announces win?
    time = 0 -- Reset game
    bullets.reset()
    particles.reset()
    if side == "l" then
        particles.ekusuploshun(rcol) -- Left wins
    else
        particles.ekusuploshun(lcol) -- Right wins
    end
end

function love.load()
    require "values"
    bullets = require "bullets"
    particles = require "particles"
    ptypes = require "ptypes"
    draw = require "draw"
    time = 0 -- Time since start
    bullets.reset()
    particles.reset()
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
    particles.update(dt)
end

function love.draw()
    love.graphics.origin()
    love.graphics.setBlendMode("add")
    bullets.draw()
    particles.draw()
end
