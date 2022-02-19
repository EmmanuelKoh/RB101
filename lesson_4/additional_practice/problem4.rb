ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

smallest_age = ages.first.last

ages.each do |_, value|
  if value <= smallest_age
    smallest_age = value
  end
end

p smallest_age

#### Alternatively
ages.values.min

