class Bot
  def initialize(botCode, botGuess)
    @botCode = botCode
    @botGuess = botGuess
    @botAttempts = 0
  end

  attr_accessor :botCode, :botGuess, :botAttempts

  # Función con la que el bot genera un codigo que el user adivinará
  def generateBotCode
    botRandomArray = []
    4.times do
      random_number = rand(1..5)
      botRandomArray << random_number
    end
    # Bot code de aquí es el codigo de colores del bot
    @botCode = botRandomArray.map do |number|
      COLORS[number - 1]
    end
  end # Termina generateBotCode

  # Función con la que el bot genera un intento de adivinada.
  def gen≈erateBotGuess
    guessRandomArray = []
    4.times do
      random_number = rand(1..5)
      guessRandomArray << random_number
    end # Termina 4.times do
    @botGuess = guessRandomArray.map do |number|
      COLORS[number - 1]
    end # Termina map
    puts "Intentos del bot #{@botAttempts}"
  end
end # Termina clase bot
