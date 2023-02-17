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


player = HumanPlayer.new
player.inputPlayerGuess
player.printPlayerGuess