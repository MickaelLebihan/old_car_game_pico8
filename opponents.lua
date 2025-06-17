function i_opponents()
    valid_pos = {8,24,48,72,96}
    opponents = {}
end

function u_opponents()
    for o in all(opponents) do
        o.y += o.speed

        if o.y > 128 then
            del(opponents,o)
        end
    end
end

function d_opponents()
    for o in all(opponents) do
        spr(o.col, o.x, o.y, 2, 2)
    end
end

function add_opponent()
    local choice = flr(rnd(3))+1
    local cols={2,4,6}

    local rnd_pos = flr(rnd(count(valid_pos)))+1

    o = {
        x = valid_pos[rnd_pos],
        y = -20,
        speed = 1,
        col= cols[choice]    }
    add(opponents, o)
end