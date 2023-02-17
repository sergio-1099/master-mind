def acceptable_color?(guess)
    colors = ["yellow", "red", "green", "white", "blue", "purple"]
    acceptable_color = false
    colors.each do |value|
        if (guess.upcase == value.upcase)
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
            print "Enter color #{index} guess: "
            @playerGuess[index] = gets.chomp
        end
    end
end


player = HumanPlayer.new
player.inputPlayerGuess
