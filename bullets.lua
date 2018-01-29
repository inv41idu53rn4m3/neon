local bullets = {
    reset = function ()
        lb = {} -- Left bullets
        rb = {} -- Right bullets
        bvm = 0 -- Bullet velocity multiplier
        blm = 1 -- Bullet limit multiplier
    end,

    bullet = function (height, type, side) -- Creates a new bullet
        local b = {h = height, d = 0, t = type}
        if side == "l" and #lb < blim * blm then
            lb[#lb + 1] = b
        elseif side == "r" and #rb < blim * blm then
            rb[#rb + 1] = b
        end
    end,

    update = function (dt)
        for k, v in pairs(lb) do -- Update left player bullets
            v.d = v.d + bv * bvm * dt
            if v.d > maxd then
                win("l")
            end
        end

        for k, v in pairs(rb) do -- Update right player bullets
            v.d = v.d + bv * bvm * dt
            if v.d > maxd then
                win("r")
            end
        end

        for i = #lb, 1, -1 do -- Remove collided bullets
            for j = #rb, 1, -1 do
                if lb[i].h == rb[j].h and lb[i].d > maxd - rb[j].d then
                    particles.explosion(lb[i].d + 50, lb[i].h * 100, 30 + (time * 10)^0.5, "bigboom", 255, 255, 255, 200)
                    table.remove(lb, i)
                    table.remove(rb, j)
                    blm = (blm^2 + 1)^0.5
                    break
                end
            end
        end
        bvm = (time / 2.5)^0.5
    end,

    draw = function ()
        for k, v in pairs(lb) do
            love.graphics.push()
            love.graphics.translate(v.d + 50, v.h * 100)
            draw.bullet(lcol)
            love.graphics.pop()
        end
        for k, v in pairs(rb) do
            love.graphics.push()
            love.graphics.translate(w - 50 - v.d, v.h * 100)
            love.graphics.scale(-1, 1)
            draw.bullet(rcol)
            love.graphics.pop()
        end
    end
}

return bullets
