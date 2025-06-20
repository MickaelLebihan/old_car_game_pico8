function i_opponents()
    opponents = {}
end

function u_opponents()
    for o in all(opponents) do
        o.y += o.speed

        if o.y > 128 then
            del(opponents,o)
            p.score += 100
        end

    end
    
end

function d_opponents()
    for o in all(opponents) do
        o.box = {
            top = o.y,
            right = o.x+o.width-1,
            bottom = o.y+o.height-1,
            left = o.x
        }
        spr(o.col, o.x, o.y, 2, 2)
        if debug then
            rect(o.box.left, o.box.top, o.box.right, o.box.bottom, o_rect_color)
        end
    end
end

function add_opponent()
    local choice = flr(rnd(3))+1
    local cols={2,4,6}

    local rnd_pos = flr(rnd(count(valid_pos)))+1

    o = {
        x = valid_pos[rnd_pos],
        y = -20,

        width = 16,
        height = 16,

        speed = o_speed,
        col= cols[choice],

        o_rect_color = 3,
    }
    
    add(opponents, o)
    
end