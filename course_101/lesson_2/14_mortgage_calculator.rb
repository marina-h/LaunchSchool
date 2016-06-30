# 14. Assignment: Mortgage / Car Loan Calculator

# edit value to change language used for messages
# available language: en = English
LANGUAGE = 'en'

# messages are found in mortgage_messages.yml
require 'yaml'

MESSAGES = YAML.load_file('14_mortgage_messages.yml')

def messages(message, lang = 'en')
  MESSAGES[lang][message]
end

def prompt(key, format_hash = "")
  message = messages(key, LANGUAGE)
  puts(format("=> #{message}", format_hash))
end

def valid_number?(num)
  # regex for (non-empty) number with an optional period between digits
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

# ask for name and greet user
prompt("welcome")

name = ""
loop do
  name = gets.chomp

  if name.empty?
    prompt("valid_name")
  else
    break
  end
end

format_name = { name: name }
prompt("say_hi", format_name)

loop do
  # ask for loan amount
  loan_total = nil
  loop do
    prompt("ask_for_loan")
    loan_total = gets.chomp
    if valid_number?(loan_total)
      loan_total = loan_total.to_f
      break
    else
      prompt("not_valid_loan")
    end
  end

  # ask for APR in correct format (example: type '5' for 5% interest)
  annual_rate = nil
  loop do
    prompt("ask_for_apr")
    annual_rate = gets.chomp
    if valid_number?(annual_rate) # TODO: check for actual percentage (0.05)
      annual_rate = annual_rate.to_f / 100
      break
    else
      prompt("not_valid_apr")
    end
  end

  # ask for loan duration in years
  loan_duration_years = nil
  loop do
    prompt("ask_for_duration")
    loan_duration_years = gets.chomp
    if valid_number?(loan_duration_years)
      loan_duration_years = loan_duration_years.to_f
      break
    else
      prompt("not_valid_duration")
    end
  end

  # summarize info given by user and confirm
  # puts("#{loan_total}, #{apr_annual}, #{loan_duration_years}")

  # calculate monthly interest rate
  monthly_rate = annual_rate / 12

  # calculate loan duration in months
  loan_duration_months = loan_duration_years * 12

  # calculate monthly payments
  # using formula P = L[c(1 + c)**n]/[(1 + c)**n - 1]
  # from http://www.mtgprofessor.com/formulas.htm
  monthly_payment =
    loan_total *
    (monthly_rate * (1 + monthly_rate)**loan_duration_months) /
    ((1 + monthly_rate)**loan_duration_months - 1)
  monthly_payment = monthly_payment.round

  format_summary = { loan_total: loan_total,
                     annual_rate: annual_rate,
                     loan_duration_years: loan_duration_years,
                     monthly_payment: monthly_payment }
  prompt("summarize", format_summary)
  prompt("repeat?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye", { name: name })
