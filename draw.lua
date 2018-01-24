draw = {
    bullet = function (r, g, b)
        love.graphics.setColor(r, g, b)
        love.graphics.polygon("fill", 10, 0, -10, -10, -10, 10)
        love.graphics.setColor(255, 255, 255)
        love.graphics.polygon("fill", 5, 0, -5, -5, -5, 5)
    end
}

return draw
