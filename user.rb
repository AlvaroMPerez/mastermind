require 'pry'
require_relative 'COLORS.rb'

def initialize(userCode = [], userGuess = [], clue = nil)
  @userCode = userCode
  @userGuess = userGuess
  @clue = clue
  @userAttempts = 0
end

class User
  def initialize(userCode, userGuess, clue )
    @userCode = userCode
    @userGuess = userGuess
    @clue = clue
    @userAttempts = 0
  end
  attr_accessor :userCode, :userGuess, :userAttempts

  # Generara el codigo de usuario
  def generateUserCode
    puts 'Select 4 colors, you can repeat'
    puts "Los colores son #{COLORS.join(', ')}"
    @userCode = []
    4.times do
      colorElection = gets.chomp.capitalize
      if COLORS.include?(colorElection)
        @userCode  << colorElection
        else
          puts 'Invalid color, try again'
          redo
      end
    end
    puts "Tus colores son #{@userCode.join(', ')}"
  end # Termina clase GenerateUserCode

  # Función para que el jugador adivine
  def userGuessing(bot_code)
    loop do(bot_code)
    puts 'Select 4 colors from here, you can repeat ;)'
    puts 'Use the numbers at your keyboard'
    puts "1. Red \n2. Green\n3. Blue \n4. Yellow \n5. Purple"
    guessArray = []
    4.times do
      numberSelected = gets.chomp.to_i
      if numberSelected.between?(1, 5)
        guessArray << numberSelected
      else
        puts 'Invalid number, please, select a number between 1 and 5'
        redo
      end
    end # Termina 4 times do
      @userGuess = guessArray.map do |number|
        COLORS[number - 1]
      end # Cierra el metodo map # Es importante cerrar el map xd

      if @userGuess == bot_code
        puts "You right! You win"
        puts "And it only took you #{@userAttempts} attempts"
        break
      else
        @userAttempts += 1
        puts "Attempts = #{@userAttempts}"
        puts 'Wrong! You wanna hint?'
        puts "1.Yes\n2.No"
        begin
        election = gets.chomp.to_i
        raise ArgumentError, 'Its Only 1 or 2, dumb ass' unless [1,2].include?(election)
        rescue ArgumentError => e
          puts e.message
          retry
        end # Cierra el begin-rescue

        if election == 1
          correct_positions = 0
          if bot_code.length == @userGuess.length
            bot_code.each_with_index do |color, index|
              if color == @userGuess[index]
                correct_positions += 1
              end
            end
          end
          puts "You have #{correct_positions} correct positions"
        end #Cierra el if elecction
      end # Cierra if else
    end # Cierra loop do
  end # Termina userGuessing
end # Termina clase User
