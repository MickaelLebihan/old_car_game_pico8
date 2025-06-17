function _init()
    o_spawn_timer = 0
    o_spawn_rate = 10

    rnd_timer = 0
    rnd_reset = 60

    p={
        x= 50,
        y=110
    }

    i_opponents()
end

function _update()
    
    if (btn(0)) p.x -= 25
    if (p.x <= 10) p.x=10

    if (btn(1)) p.x += 25
    if (p.x >= 110) p.x=110

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

    spr(0, 128/2-16, p.y, 2, 2)


    d_opponents()

    print(text, 50, 50)
end