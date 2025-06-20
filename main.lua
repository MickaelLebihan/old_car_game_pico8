function _init()
    -- 5 lanes
    --valid_pos = {8, 32, 56, 80, 104}
    debug = true

    difficulty_trigger = false

    -- 3 lanes
    valid_pos = {32, 56, 80}
    current_pos = 2

    -- 3 lanes
    --valid_pos = {8, 32, 56}

    -- time before adding a new car
    o_spawn_timer = 0
    o_spawn_rate = 50 -- 60 frames = 1 second

    -- opponent car speed
    o_speed = 1

    rnd_timer = 0
    rnd_reset = 60

    p={
        life = 3,
        score = 0,

        box = {},

        current_pos = 2,
        x = 0,
        y = 110,

        width = 16,
        height = 16,
        rect_color = 3,
    }

    if debug then
        p.score = 900
    else
        p.score = 0
    end

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

    p.x = valid_pos[p.current_pos]
    p.rect_color = 3

    p.box = {
        top = p.y,
        right = p.x+p.width-1,
        bottom = p.y+p.height-1,
        left = p.x
    }

    --check for collisions
    for o in all(opponents) do
        if p.box.left < o.box.right and
            p.box.right > o.box.left and
            p.box.top < o.box.bottom and
            p.box.bottom > o.box.top then
            -- collision detected
            p.rect_color = 8
            o.rect_color = 8
            p.life -= 1
            if p.life < 0 then
                -- game over
                p.life = 0
                p.score = 0
            end
        end
    end

    o_spawn_timer += 1
    if o_spawn_timer == o_spawn_rate then
        add_opponent()
        o_spawn_timer = 0
    end

    if (p.score%1000 == 0) and (not difficulty_trigger) then
        difficulty_trigger = true
        o_spawn_rate = max(10, o_spawn_rate - 5)
        o_speed += 1
    else
        difficulty_trigger = false
    end

    u_opponents()
end

function _draw()
    cls()
    map(0,0,0,0,16,16)
    --spr(0, p.x, p.y, 2, 2)

    d_opponents()

    spr(0, valid_pos[p.current_pos], p.y, 2, 2)

    -- display debug info
    if debug then
        rect(p.box.left, p.box.top, p.box.right, p.box.bottom, p.rect_color)
        print(o_spawn_rate, 1, 105, 7)
        print(o_speed, 1, 112, 7)
    end

    -- display life
    for i=1,p.life do
        spr(11, 2 + (i-1)*8, 120)
    end

    -- display score
    print(p.score, 1, 1, 7)
    --spr(10, valid_pos[p.current_pos], 90, 4, 4)
end