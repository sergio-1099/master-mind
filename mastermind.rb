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
