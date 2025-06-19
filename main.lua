function _init()
    -- 5 lanes
    --valid_pos = {8, 32, 56, 80, 104}

    -- 3 lanes
    valid_pos = {32, 56, 80}

    -- 3 lanes
    --valid_pos = {8, 32, 56}
    current_pos = 2

    o_spawn_timer = 0
    o_spawn_rate = 20
    o_speed = 5

    rnd_timer = 0
    rnd_reset = 60

    p={
        current_pos = 3,
        y = 110,
    }

    i_opponents()
end

function _update()
    
    
    if btnp(0) then
        p.current_pos -= 1
    end
    if (p.current_pos < 1) p.current_pos = 1


    if btnp(1) then
        p.current_pos += 1
    end
    if (p.current_pos > count(valid_pos)) p.current_pos = count(valid_pos)

    o_spawn_timer += 1
    if o_spawn_timer == o_spawn_rate then
        add_opponent()
        o_spawn_timer = 0
    end

    -- rnd_timer += 1
    -- if (rnd_timer == rnd_reset) then
    --     local choice = flr(rnd(3))+1
    --     local cols={2,4,6}
    --     text = choice

    --     rnd_timer = 0
    -- end

    u_opponents()
end

function _draw()
    cls()
    map(0,0,0,0,16,16)
    --spr(0, p.x, p.y, 2, 2)

    
    
    d_opponents()

    spr(0, valid_pos[p.current_pos], p.y, 2, 2)
    --spr(10, valid_pos[p.current_pos], 90, 4, 4)
end