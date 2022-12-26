function half_dist!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        half_dist_without_moveback!(robot, side)
        move!(robot, inverse(side))
    end
end

function half_dist_without_moveback!(robot, side)
    if !isborder(robot, side)
        move!(robot, side)
        half_dist!(robot, side)
    end
end

inverse(side::HorizonSide) = HorizonSide((Int(side) +2)% 4)

robot = Robot("untitled.sit", animate = true)
side = readline()
side = parse(Int64, side)
half_dist!(robot, HorizonSide(side))