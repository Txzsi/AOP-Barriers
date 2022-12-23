config = {}

config.setup = {
    allowed_ace_perm = "staff-perms", -- you can either use ace permissions for aop changing permissions or a framework dept. Or use both, if you want to use one but not the other leave it blank.
    default_aop = "Sandy Shores",
    aop_draw_text = "Current AOP:~c~",
    text_position_x = 0.165,
    text_position_y = 0.910,
    -- set aop's to trigger barriers -- 
    sandy_barrier_trigger_aop = "Blaine County [Sandy Banned]", -- will trigger sandy barriers
    city_barrier_trigger_aop = "Blaine County [City Banned]" -- will trigger city barriers

}

config.sandy_barrier_location = { -- one table covers atleast 4-5 metres longways
    { x = 1866.07, y = 3234.61, z = 45.05, heading = 37.98 }, -- Panorama Dr barrier start 
    { x = 1859.83, y = 3230.57, z = 45.07, heading = 37.98 }, 
    { x = 1853.74, y = 3224.88, z = 44.91, heading = 44.43 },
    { x = 1850.9, y = 3221.58, z = 44.98, heading = 50.98 },  -- Panorama Dr barrier end 
    { x = 2520.78, y = 4136.8, z = 38.44, heading = 155.49 },  -- east joshua next to senora fw start
    { x = 2516.29, y = 4137.94, z = 38.44, heading = 158.1 },
    { x = 2512.32, y = 4140.36, z = 38.44, heading = 162.27 }, -- east joshua next to senora fw end
}

config.city_barrier_location = {
    { x = 1117.59, y = 413.68, z = 83.45, heading = 136.56 }, -- los santos freeway barier
    { x = 1128.65, y = 402.45, z = 84.05, heading = 137.66 },
    { x = 1195.89, y = 515.92, z = 82.1, heading = 128.96 },
    { x = 1237.74, y = 492.33, z = 81.53, heading = 143.49 },
}
