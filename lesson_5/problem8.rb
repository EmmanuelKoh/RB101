hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |k, v|
  v.each do |string|
    string.split('').each do |char|
      if "aeiou".include?(char)
        puts char
      end
    end
  end
end