# Assignment: Mortgage / Car Loan Calculator

# edit value to change language used for messages
# available language: en = English
LANGUAGE = 'en'

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
  /\d/.match(num) && /^\d*\.?\d*$/.match(num) && num.to_f > 0
end

def ask_until_valid_num(input, not_valid_prompt)
  loop do
    input = gets.chomp
    if valid_number?(input)
      return input.to_f
    else
      prompt(not_valid_prompt)
    end
  end
end

def calculate_monthly_payment(l, n, c)
  monthly_payment = l * (c * (1 + c)**n) / ((1 + c)**n - 1)
  monthly_payment.round
end

name = ""
prompt("welcome")

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
  loan_total = annual_rate = loan_years = 0

  prompt("ask_for_loan")
  loan_total = ask_until_valid_num(loan_total, "not_valid_loan")

  prompt("ask_for_apr")
  annual_rate = ask_until_valid_num(annual_rate, "not_valid_apr")

  prompt("ask_for_duration")
  loan_years = ask_until_valid_num(loan_years, "not_valid_duration")

  monthly_rate = annual_rate / 100 / 12
  loan_months = loan_years * 12

  monthly_payment =
    calculate_monthly_payment(loan_total, loan_months, monthly_rate)

  format_summary = { loan_total: format("%.2f", loan_total),
                     annual_rate: annual_rate,
                     loan_years: loan_years,
                     monthly_payment: monthly_payment }
  prompt("summarize", format_summary)
  prompt("repeat?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye", { name: name })
