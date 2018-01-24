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
                    table.remove(lb, i)
                    table.remove(rb, j)
                    blm = (blm^2 + 1)^0.5
                    goto done
                end
            end
        end
        ::done::
        bvm = (time / 2.5)^0.5
    end
}

return bullets
