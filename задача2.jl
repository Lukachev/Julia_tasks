using HorizonSideRobots
function along!(robot)
    num_step = 0
    while !isborder(robot, Nord)
        move!(robot,Nord)
        num_step += 1
    end
    return num_step
end

function squer!(robot)
    side = Ost
    num_steps = 0
    while ! isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
        num_steps += 1
    end
    for side in (Sud, West, Nord)
        while ! isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
    side = Ost
    for _ in 1:(11 - num_steps)
        move!(robot, side)
        putmarker!(robot)
    end
end

function goback(robot, a)
    for t in 0:a
        move!(robot, Sud)
    end
end

function solution!(robot)
    a = along!(robot)
    squer!(robot)
    print(a)
    goback(robot, a - 2)
end

a = solution!(Robot("1q.sit", animate=true))