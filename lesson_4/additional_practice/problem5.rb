flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.index do |name|
  name[0..1] == 'Be'
end
