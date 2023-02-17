class HumanPlayer
    attr_reader :playerGuess

    def initialize
        @playerGuess = Array.new(4)
        @playerCode = Array.new(4)
    end
end


player = HumanPlayer.new
player.inputPlayerGuess
