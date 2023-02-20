def acceptable_color?(guess)
    colors = ["yellow", "red", "green", "white", "blue", "purple"]
    acceptable_color = false
    colors.each do |value|
        if (guess == value)
            acceptable_color = true
        end
    end

    return acceptable_color
end

def choose_random_color
    colors = ["yellow", "red", "green", "white", "blue", "purple"]
    random = rand(6)
    return colors[random]
end

class HumanPlayer
    attr_reader :player_guess

    def initialize
        @player_guess = Array.new(4)
        @player_code = Array.new(4)
    end

    def input_player_guess
        puts "Time to guess!"
        @player_guess.each_index do |index|
            print "Enter color #{index + 1} guess: "
            @player_guess[index] = gets.chomp.downcase
            until (acceptable_color?(@player_guess[index]))
                print "Unnaceptable color. Try again: "
                @player_guess[index] = gets.chomp.downcase
            end
        end
    end

    def input_player_code
        puts "Time to create a secret code!"
        @player_code.each_index do |index|
            print "Enter color #{index + 1}: "
            @player_code[index] = gets.chomp.downcase
            until (acceptable_color?(@player_code[index]))
                print "Unnaceptable color. Try again: "
                @player_code[index] = gets.chomp.downcase
            end
        end
    end

    def check_computer_guess(computer_guess)
        accuracy_array = Array.new(4)
        @player_code.each_index do |index|
            if(computer_guess[index] == @player_code[index])
                accuracy_array[index] = 1
            else
                accuracy_array[index] = 0
            end
        end

        return accuracy_array
    end

    def print_player_guess
        puts "Player guessed: #{@player_guess}."
    end
end

class ComputerPlayer
    attr_reader :computer_guess

    def initialize
        @computer_code = Array.new(4)
        @computer_guess = Array.new(4)
    end

    def create_code
        @computer_code.each_index do |index|
            @computer_code[index] = choose_random_color()
        end
    end

    def create_guess(accuracy_array)
        accuracy_array.each_index do |index|
            if (accuracy_array[index] == 0)
                @computer_guess[index] = choose_random_color()
            elsif (accuracy_array[index] == 1)
                @computer_guess[index] = @computer_guess[index]
            end 
        end
        print "\nComputer guesses: #{@computer_guess[0]}, #{@computer_guess[1]},"
        puts " #{@computer_guess[2]}, and #{@computer_guess[3]}."
        return @computer_guess
    end

    def check_guess(player_guess)
        if (@computer_code == player_guess)
            return true
        end
        puts "Guess Information:"
        @computer_code.each_index do |index|
            if(@computer_code.include?(player_guess[index]))
                if(@computer_code[index] == player_guess[index])
                    puts "Color #{index + 1} is correct!"
                else
                    print "Color #{index + 1} IS in the secret code. "
                    puts "But in another place..."
                end
            else
                puts "Color #{index + 1} is WRONG."
            end
        end
        return false
    end
end

def playerGuesses
    human = HumanPlayer.new
    computer = ComputerPlayer.new

    computer.create_code
    puts "Computer has created a code!"
    human.input_player_guess

    until (computer.check_guess(human.player_guess))
        human.input_player_guess
    end

    puts "Correct!"
end

def computerGuesses
    human = HumanPlayer.new
    computer = ComputerPlayer.new

    human.input_player_code
    puts "Player has entered code!"
    guess = computer.create_guess([0, 0, 0, 0])
    try = 1

    until ((human.check_computer_guess(guess) == [1, 1, 1, 1]) || try == 12)
        guess = computer.create_guess(human.check_computer_guess(guess))
        try += 1
        sleep 1
    end

    if (try >= 12)
        puts "\nComputer Lost! You win!"
    else
        puts "\nComputer won! You lost..."
    end
end

more_games = "y"
while (more_games == "Y" || more_games == "y")
    print "Enter 1 if you want to be the guesser or 2 if you want to encode: "
    game_type = gets.chomp.to_i
    if (game_type == 1)
        playerGuesses()
    elsif (game_type == 2)
        computerGuesses()
    end

    print "\nDo you want to play again? (Y/N): "
    more_games = gets.chomp.downcase
    until (more_games == "y" || more_games == "n")
        print "Not a valid choice. Choose again: "
        more_games = gets.chomp.downcase 
    end
end