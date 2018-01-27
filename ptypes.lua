local ptypes = {
    bigboom = {
        tex = love.graphics.newImage("assets/particles/big1.png"),
        init = function (p)
            if p.c[4] ~= nil then
                p.alpha0 = p.c[4]
            else
                p.alpha0 = 255
            end
        end,
        update = function (p)
            if p.l < 1 then
                p.c[4] = p.alpha0 * p.l
            end
        end
    }
}

return ptypes
