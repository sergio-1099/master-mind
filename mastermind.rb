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
        puts "Time to guess!"
        @playerGuess.each_index do |index|
            print "Enter color #{index + 1} guess: "
            @playerGuess[index] = gets.chomp.downcase
            until (acceptable_color?(@playerGuess[index]))
                print "Unnaceptable color. Try again: "
                @playerGuess[index] = gets.chomp.downcase
            end
        end
    end

    def inputPlayerCode
        puts "Time to create a secret code!"
        @playerCode.each_index do |index|
            print "Enter color #{index + 1}: "
            @playerCode[index] = gets.chomp.downcase
            until (acceptable_color?(@playerCode[index]))
                print "Unnaceptable color. Try again: "
                @playerCode[index] = gets.chomp.downcase
            end
        end
    end

    def checkComputerGuess(computerGuess)
        accuracy_array = Array.new(4)
        @playerCode.each_index do |index|
            if(computerGuess[index] == @playerCode[index])
                accuracy_array[index] = 1
            else
                accuracy_array[index] = 0
            end
        end

        return accuracy_array
    end

    def printPlayerGuess
        puts "Player guessed: #{@playerGuess}."
    end
end

class ComputerPlayer
    attr_reader :computerGuess

    def initialize
        @computerCode = Array.new(4)
        @computerGuess = Array.new(4)
    end

    def createCode
        @computerCode.each_index do |index|
            @computerCode[index] = choose_random_color()
        end
    end

    def createGuess(accuracy_array)
        accuracy_array.each_index do |index|
            if (accuracy_array[index] == 0)
                @computerGuess[index] = choose_random_color()
            elsif (accuracy_array[index] == 1)
                @computerGuess[index] = @computerGuess[index]
            end 
        end
        p @computerGuess
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