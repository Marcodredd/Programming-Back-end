# The user makes a choice
# The computer makes a choice
# The winner is displayed

VALID_CHOICES = { "r" => "rock", "p" => "paper", "s" => "scissors",
                  "l" => "lizard", "sp" => "spock" }

def prompt(message)
  puts "=> #{message}"
end

def rock?(player1, player2)
  player1 == 'rock' && player2 == 'scissors' ||
    player1 == 'rock' && player2 == 'lizard'
end

def lizard?(player1, player2)
  player1 == 'lizard' && player2 == 'paper' ||
    player1 == 'lizard' && player2 == 'spock'
end

def spock?(player1, player2)
  player1 == 'spock' && player2 == 'scissors' ||
    player1 == 'spock' && player2 == 'rock'
end

def scissors?(player1, player2)
  player1 == 'scissors' && player2 == 'paper' ||
    player1 == 'scissors' && player2 == 'lizard'
end

def paper?(player1, player2)
  player1 == 'paper' && player2 == 'rock' ||
    player1 == 'paper' && player2 == 'spock'
end

def win?(first, second)
  rock?(first, second) || scissors?(first, second) || paper?(first, second) ||
    spock?(first, second) || lizard?(first, second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt "You won"
  elsif win?(computer, player)
    prompt "Computer won"
  else
    prompt "It's a tie!"
  end
end

loop do
  choice = ''
  loop do
    prompt "Choose one: r => rock, p => paper, l => lizard,
            s => scissors, sp => spock"
    choice = gets.chomp

    if VALID_CHOICES.key?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.values.sample
  prompt "You chose: #{VALID_CHOICES[choice]}:
          Computer chose: #{computer_choice}"

  display_results(VALID_CHOICES[choice], computer_choice)

  prompt "Do you want to play again?"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye!"
