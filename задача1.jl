using HorizonSideRobots
function forword_putmarker!(robot, side)
    num_steps = 0
    while !isborder(robot, HorizonSide(side))
        move!(robot,HorizonSide(side))
        putmarker!(robot)
        num_steps += 1
    end
    side = reverse!(side)
    for _ in 0:(num_steps - 1)
       move!(robot,HorizonSide(side))
    end
end

function reverse!(side)
    side = (side + 2) % 4
end

function cross(robot)
    for side in 0:3
        forword_putmarker!(robot, side)
    end 
    putmarker!(robot)
end

cross(Robot("pole1.sit", animate=true))
