local particles = {
    reset = function ()
        pl = {} -- List of particles
    end,
    particle = function (posx, posy, velx, vely, angle, vela, type, life, r, g, b, a)
        local p = {x = posx, y = posy, vx = velx, vy = vely, a = angle, va = vela, t = type, l = life, c = {r, g, b, a}}
        ptypes[type].init(p)
        pl[#pl + 1] = p
    end,
    update = function (dt)
        for i = #pl, 1, -1 do
            pl[i].x = pl[i].x + pl[i].vx * dt
            pl[i].y = pl[i].y + pl[i].vy * dt
            pl[i].a = pl[i].a + pl[i].va * dt
            pl[i].l = pl[i].l - dt
            ptypes[pl[i].t].update(pl[i])
            if pl[i].l < 0 then
                table.remove(pl, i)
            end
        end
    end,
    draw = function ()
        for k, v in pairs(pl) do
            love.graphics.push()
            love.graphics.translate(v.x, v.y)
            draw.particle(v)
            love.graphics.pop()
        end
    end,
    explosion = function (x, y, power, type, r, g, b, a)
        for i = 1, power^2 / 300 do
            local ang = math.random() * math.pi * 2
            local vel = math.random() * power
            local angvel = math.random() * 2 * math.pi - math.pi
            local life = 1 + math.random()
            particles.particle(x, y, math.cos(ang) * vel, math.sin(ang) * vel, ang, angvel, type, life, r, g, b, a)
        end
    end,
    ekusuploshun = function (r, g, b)
        particles.explosion(w / 2, h / 2, w / 2, "bigboom", r, g, b, 150)
    end
}

return particles
