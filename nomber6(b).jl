function mark_four_cells!(r::Robot) #подзадача б 
    path = get_left_down_angle_modified!(r)
    n_steps_to_sud = 0
    n_steps_to_west = 0
    for step in path
        if step[1] == Sud
            n_steps_to_sud += step[2]
        else
            n_steps_to_west += step[2]
        end
    end

    moves!(r, Ost, n_steps_to_west)
    putmarker!(r)
    move_until_border!(r, Ost)
    moves!(r, Nord, n_steps_to_sud)
    putmarker!(r)
    get_left_down_angle_modified!(r)

    moves!(r, Nord, n_steps_to_sud)
    putmarker!(r)
    move_until_border!(r, Nord)
    moves!(r, Ost, n_steps_to_west)
    putmarker!(r)
    get_left_down_angle_modified!(r)

    way_back!(r, path)
end

function get_left_down_angle_modified!(r::Robot)::Vector{Tuple{HorizonSide, Int}}
    steps = []
    while !(isborder(r, West) && isborder(r, Sud))
        steps_to_West = move_until_border!(r, West)
        steps_to_Sud = move_until_border!(r, Sud)
        push!(steps, (West, steps_to_West))
        push!(steps, (Sud, steps_to_Sud))
    end
    return steps
end

function move_until_border!(r::Robot, side::HorizonSide)::Int
    n_steps = 0
    while !isborder(r, side)
        n_steps += 1
        move!(r, side)
    end
    return n_steps
end

function way_back!(r::Robot, path::Vector{Tuple{HorizonSide, Int}})
    inv_path = inversed_path(path)
    way!(r, inv_path)
end

function way!(r::Robot, path::Vector{Tuple{HorizonSide, Int}})
    for step in path
        moves!(r, step[1], step[2])
    end
end

r = Robot("squer_hard.sit", animate=true)
mark_four_cells!(r)