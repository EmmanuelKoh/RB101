arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr2 = arr.dup.map do |hash|
  hash.map { |k, v| [k, (v += 1)]}.to_h
end

p arr2

p arr