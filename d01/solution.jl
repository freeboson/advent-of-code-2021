v = map(l -> parse(Int, l), readlines("input"))
count(>(0), v[2:end] - v[1:end-1]) |> println

w = v[3:end] + v[2:end-1] + v[1:end-2]
count(>(0), w[2:end] - w[1:end-1]) |> println
