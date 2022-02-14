advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!('Few things in life are as important as ')

p advice

#alternatively
advice.slice!(0, advice.index('house'))  # => "Few things in life are as important as "
