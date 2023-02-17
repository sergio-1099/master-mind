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
    attr_reader :playerGuess

    def initialize
        @playerGuess = Array.new(4)
        @playerCode = Array.new(4)
    end

    def inputPlayerGuess
        @playerGuess.each_index do |index|
            print "Enter color #{index + 1} guess: "
            @playerGuess[index] = gets.chomp.downcase
            until (acceptable_color?(@playerGuess[index]))
                print "Unnaceptable color. Try again: "
                @playerGuess[index] = gets.chomp.downcase
            end
        end
    end

    def printPlayerGuess
        puts "Player guessed: #{@playerGuess}."
    end
end

class ComputerPlayer
    def initialize
        @computerCode = Array.new(4)
        @computerGuess = Array.new(4)
    end

    def createCode
        @computerCode.each_index do |index|
            @computerCode[index] = choose_random_color()
        end
    end

    def checkGuess(playerGuess)
        puts "Guess Information:"
        @computerCode.each_index do |index|
            if(@computerCode.include?(playerGuess[index]))
                if(@computerCode[index] == playerGuess[index])
                    puts "Color #{index + 1} is correct!"
                else
                    puts "Color #{index + 1} IS in the secret code. But in another place..."
                end
            else
                puts "Color #{index + 1} is WRONG."
            end
        end
    end
end