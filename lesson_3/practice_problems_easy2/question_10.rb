WIDTH = 40

title = "Flintstone Family Members"

spaces = WIDTH - title.length

((spaces / 2).ceil).times do
  title.prepend(" ").concat(" ")
end

p title

# alternatively

title2 = "Flintstone Family Members"
p title.center(40)