# 6. Walk-through: Calculator

# edit value to change language used for messages
# available language: en = English
LANGUAGE = 'en'

# messages are found in calculator_messages.yml
require 'yaml'

MESSAGES = YAML.load_file('06_calculator_messages.yml')

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

def operation_to_message(op)
  case op
  when "1"
    messages("adding")
  when "2"
    messages("subtracting")
  when "3"
    messages("multiplying")
  when "4"
    messages("dividing")
  end
end

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
prompt("ask_for_input")

loop do
  num1 = nil
  # Ask the user for two numbers, loop until numbers are valid
  loop do
    prompt("num1_prompt")
    num1 = gets.chomp
    if valid_number?(num1)
      num1.to_f
      break
    else
      prompt("valid_num")
    end
  end

  num2 = nil

  loop do
    prompt("num2_prompt")
    num2 = gets.chomp

    if valid_number?(num2)
      num2.to_f
      break
    else
      prompt("valid_num")
    end
  end

  prompt("ask_for_operator")

  operator = ""
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("valid_operator")
    end
  end

  format_operation = { operation_msg: operation_to_message(operator) }
  prompt("start_operation", format_operation)

  # output result of operation
  result =
    case operator
    when "1"
      num1.to_f + num2.to_f
    when "2"
      num1.to_f - num2.to_f
    when "3"
      num1.to_f * num2.to_f
    when "4"
      num1.to_f / num2.to_f
    end

  format_answer = { result: result }
  prompt("answer", format_answer)
  prompt("rerun?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("goodbye")
