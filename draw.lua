draw = {
    bullet = function (colour)
        love.graphics.setColor(colour)
        love.graphics.polygon("fill", 10, 0, -10, -10, -10, 10)
        love.graphics.setColor(255, 255, 255)
        love.graphics.polygon("fill", 5, 0, -5, -5, -5, 5)
    end,
    particle = function (p)
        love.graphics.setColor(p.c[1], p.c[2], p.c[3], p.c[4])
        love.graphics.draw(ptypes[p.t].tex, 0, 0, p.a, 1, 1, ptypes[p.t].tex:getWidth() / 2, ptypes[p.t].tex:getHeight() / 2)
    end
}

return draw
