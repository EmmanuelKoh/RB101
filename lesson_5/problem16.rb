def uuid
  uuid_array = []
  rand_array = ('0'..'9').to_a + ('a'..'f').to_a
  uuid_section = [8, 4, 4, 4, 12]
  uuid_section.each_with_index do |num, ind|
    num.times do
      uuid_array << rand_array.sample
    end
    uuid_array << '-' unless ind == (uuid_section.size - 1)
  end
  uuid_array.join
end

p uuid