# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

str_array = advice.split(' ')

advice = str_array.map! { |string| string == 'important' ? 'urgent' : string }.join(' ')

puts advice

# Alternative method

advice2 = "Few things in life are as important as house training your pet dinosaur."

advice2.gsub!('important', 'urgent')

puts advice2