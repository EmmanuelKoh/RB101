# ask the user for the loan amount
# ask the user for APR
# ask the user for the loan duration 

# calculate monthly interest rate
# calculate loan duration in months
# calculate the monthly payment

# perform the operation on the two numbers
# output the result

def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to the Mortgage Calculator!")
  prompt("-----------------------------------")

  prompt "What is your loan amount?"
  loan_amount = ''
  loop do  
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt "Must enter positive number."
    else
      break
    end
  end

  prompt "What is the APR?"
  apr = ''
  loop do
    apr = gets.chomp

    if apr.empty? || apr.to_f < 0
      prompt "Must enter positive number."
    else
      break
    end
  end

  prompt "What is the loan duration (in year)?"

  loan_duration = ''
  loop do
    loan_duration = gets.chomp

    if loan_duration.empty? || loan_duration.to_i < 0
      prompt "Enter a valid number"
    else
      break
    end
  end

  monthly_interest = (apr.to_f / 100) / 12
  loan_duration_month = loan_duration.to_f * 12
  puts -loan_duration_month
  monthly_payment = loan_amount.to_f * 
                    (monthly_interest / 
                    (1 - (1 + monthly_interest) ** (-loan_duration_month)))

  prompt "your monthly payment is $#{monthly_payment.round(2)}"

  prompt "Would you like to make another calculation?"
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')

end
