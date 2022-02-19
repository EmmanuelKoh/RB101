flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = flintstones.index(name)
end

### Alternatively

flinstones_hash = {}
flinstones.each_with_index do |name, index|
  flinstones_hash[name] = index
end

