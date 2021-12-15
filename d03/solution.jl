using Test

function elect(v)
    activity = zeros(Int, length(first(v)))
    for line in v
        @assert length(line) == length(activity)
        for i in 1:length(line)
            if line[i] == '1'
                activity[i] += 1
            else
                activity[i] -= 1
            end
        end
    end
    activity
end

function rates(fn)
    activity = elect(readlines(fn))
    γ = parse(Int, join(map(Int, map(>(0), activity))), base=2)
    n = length(activity)
    ϵ = (2^n - 1) ⊻ γ
    [γ, ϵ]
end

println(@test rates("test") == [22, 9])
println(@test prod(rates("test")) == 198)

rates("input") |> println
rates("input") |> prod |> println

function rating(fn, pref)
    v = readlines(fn)
    n = length(first(v))
    for i in 1:n
        length(v) == 1 && break
        activity = elect(v)
        bitcheck = pref(activity[i], i)
        v = filter(bitcheck, v)
    end
    parse(Int, first(v), base=2)
end

oxygen(n, i) = l -> n ≥ 0 ? l[i] == '1'  : l[i] == '0'
co2(n, i) = l -> n < 0 ? l[i] == '1'  : l[i] == '0'

println(@test rating("test", oxygen) == 23)
println(@test rating("test", co2) == 10)
println(@test rating("test", oxygen) * rating("test", co2) == 230)


println(rating("input", oxygen) * rating("input", co2))
