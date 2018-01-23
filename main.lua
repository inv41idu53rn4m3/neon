function bullet(height, type) -- Creates a new bullet
    local b = {h = height, d = 0, t = type}
    return b
end

function win(s) -- Announces win?
    if s == "l" then
        -- Left wins
    else
        -- Right wins
    end
    time = 0
    bv = 200
    blim = 2
    lb, rb = {}, {}
end

function love.load()
    w, h = 1000, 400 -- Size of window
    time = 0 -- Time since start
    bv = 200 -- Bullet velocity
    blim = 2 -- Bullet limit
    maxd = 900 -- Win condition
    lb = {} -- Left bullets
    rb = {} -- Right bullets
    lcol = {200, 70, 230} -- Left player colour
    rcol = {70, 230, 200} -- Right player colour
    love.window.setMode(w, h)
end

function love.keypressed(key, scancode, isrepeat)
    if not isrepeat then
        if scancode == "z" and #lb < blim then
            lb[#lb + 1] = bullet(1, 0)
        elseif scancode == "x" and #lb < blim then
            lb[#lb + 1] = bullet(2, 0)
        elseif scancode == "c" and #lb < blim then
            lb[#lb + 1] = bullet(3, 0)
        elseif scancode == "," and #rb < blim then
            rb[#rb + 1] = bullet(1, 0)
        elseif scancode == "." and #rb < blim then
            rb[#rb + 1] = bullet(2, 0)
        elseif scancode == "/" and #rb < blim then
            rb[#rb + 1] = bullet(3, 0)
        end
    end
end

function love.update(dt)
    time = time + dt -- Update timer
    for k, v in pairs(lb) do -- Update left player bullets
        v.d = v.d + bv * dt
        if v.d > maxd then
            win("l")
        end
    end

    for k, v in pairs(rb) do -- Updade right player bullets
        v.d = v.d + bv * dt
        if v.d > maxd then
            win("r")
        end
    end

    for i = #lb, 1, -1 do -- Remove collided bullets
        for j = #rb, 1, -1 do
            if lb[i].h == rb[j].h and lb[i].d > maxd - rb[j].d then
                table.remove(lb, i)
                table.remove(rb, j)
                bv = bv * 1.02
                blim = (blim^2 + 1)^0.5
                goto done
            end
        end
    end
    ::done::
end

function love.draw()
    love.graphics.setColor(lcol)
    for k, v in pairs(lb) do
        love.graphics.polygon("fill", v.d + 60, v.h * 100, v.d + 40, v.h * 100 - 10, v.d + 40, v.h * 100 + 10)
    end
    love.graphics.setColor(rcol)
    for k, v in pairs(rb) do
        love.graphics.polygon("fill", w - (v.d + 60), v.h * 100, w -(v.d + 40), v.h * 100 - 10, w - (v.d + 40), v.h * 100 + 10)
    end
end
