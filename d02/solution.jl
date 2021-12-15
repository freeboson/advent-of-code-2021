function convert(line)
    (direction, count) = split(line)
    count = parse(Int, count)
    direction == "down" && return [0, count]
    direction == "up" && return [0, -count]
    [count, 0]
end

map(convert, readlines("input")) |> sum |> prod |> println

function aim(fn)
    horiz = 0
    depth = 0
    aim = 0
    for line in eachline(fn)
        (direction, count) = split(line)
        count = parse(Int, count)
        if direction == "down"
            aim += count
        elseif direction == "up"
            aim -= count
        else
            horiz += count
            depth += aim*count
        end
    end
    [horiz, depth]
end

aim("input") |> prod |> println
