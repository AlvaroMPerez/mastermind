require_relative 'bot.rb'
require_relative 'user.rb'

def intructions
    puts 'Welcome to mastermind. this is my very first game made in general and even more with ruby.'
    puts 'Lets beging with the game'
    puts 'Guess or be guessed? Thats the main question'
    puts "1.Guess\n2.Be guessed"
end

def user_election
  begin
    userElection = gets.chomp.to_i
    raise ArgumentError, 'Only chose 1 or 2' unless [1,2].include?(userElection)
    rescue ArgumentError => e
      puts e.message
      retry
  end

  user = User.new([],[],'clue')
  bot = Bot.new([],[])
  # Aquí el usuario escogió adivinar
  if userElection == 1
    puts 'Ok you want to...'
    sleep(1)
    puts 'Guess'
    sleep(1)
    puts 'Let me choose my code.'
    sleep(2)
    bot.generateBotCode
    # Este es el codigo del bot
    bot_code = bot.botCode
    print bot_code
    sleep (1)
    puts 'Ok now I have my code'
    sleep (1)
    puts 'Try out to guess'
    user.userGuessing(bot_code)
    else
      # Aquí el usuario escogió que le adivinen.
      botGuessing(user,bot)
  end # Cierra if userElecction == 1
end

def botGuessing(user, bot)
  puts 'Ok choose your colors'
      sleep (1)
      user.generateUserCode
      sleep (1)
      puts "Imma try to guess"
      sleep (1)

      loop do
      puts 'What about...'
      bot.generateBotGuess
      bot_guess_code = bot.botGuess
      puts "I think its: #{bot_guess_code.join(', ')}"
      bot.botAttempts += 1
      puts "Am I fine?\n1. Yes \n2. No"
      begin
        election = gets.chomp.to_i
        raise ArgumentError, 'Only choose 1 or 2' unless [1,2].include?(election)
        rescue   ArgumentError => e
        puts e.message
        retry
      end #Cierra begin

      if bot.botAttempts == 11
        puts 'Hmmmm.... this is my last guess or I will explote'
        sleep (1)
        puts 'I choose...'
        sleep (1)
        puts "I think its: #{user.userCode.join(', ')}"
        sleep (1)
        puts 'N I win'
        break
      end # Cierra el if que acaba con el sufriemiento del bot

     if election == 1 && bot_guess_code == user.userCode
      puts 'Great, I win'
      break
    elsif election == 1 && bot_guess_code != user.userCode
      puts 'Liar liar, pants on fire. I am wrong'
    elsif election == 2 && bot_guess_code == user.userCode
      puts 'You liar, I win'
      break
    elsif election == 2 && bot_guess_code != user.userCode
      puts 'Ok, ok you’re right! I will try again'
    end

      end # Cierra el loop do



end # Cierra bot guessing
