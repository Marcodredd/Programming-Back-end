# Build a command line calculator program that does the following:
# asks for two numbers
# asks for the type of operatiion to perform: add, subtract, multiply or divide
# displays the result
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(input)
  integer?(input) || float?(input)
end

# Integer validation
def integer?(input)
  input.to_i.to_s == input
end

# Float validation
def float?(input)
  input.to_f.to_s == input
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES['welcome'])
name = ''
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt "Hi #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt(MESSAGES['number1'])
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  number2 = ''
  loop do
    prompt(MESSAGES['number2'])
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  operator_prompt = <<-MSG
  what operation would you like to perform
  1) Add
  2) subtract
  3) multiply
  4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES['operator'])
    end
  end

  prompt "#{operation_to_message(operator)} the two numbers..."

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             (number1.to_f / number2.to_f).round(2)
           end

  prompt "The results is #{result}"

  prompt(MESSAGES['calculate_again'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt(MESSAGES['bye'])
