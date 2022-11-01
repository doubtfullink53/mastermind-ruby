class Main
  def initialize
    @guess_count = 0
  end

  def computer_random_numbers
    @number_array = Array.new(4) { rand(1..9).to_s }
    # @number_array = Array.new(4) { '4' }
  end

  def player_number
    puts 'What 4 numbers do you guess? (12 chances to guess)'
    @player_choice_number = gets.gsub(/\s+/, '').chomp
    @player_choice = @player_choice_number.split(//).to_a.take(4)
    puts 'Integer' if @player_choice == Integer
  end

  def check_match
    count = 0
    for i in @number_array do

      if @player_choice == @number_array
        win
        break
      end
      puts "position #{count + 1} matches" if @player_choice[count] == @number_array[count]
      puts "position #{count + 1} doesn't  match" if @player_choice[count] != @number_array[count]
      count += 1
    end
    guess_again
  end

  def output_numbers
    # puts "player number choices #{@player_choice} computer choice #{@number_array}" for testing 
    puts "player number choices #{@player_choice} "
  end

  def win
    p 'Congratulations all numbers matched in the right spot you won!!!!!!'
    play_again
  end

  def play_again
    puts 'Want to play Again? YES(Y) or NO(N) ?'
    choice = gets.chomp
    choice.downcase
    if %w[y yes].include?(choice)
      play_start
    else
      exit
    end
  end

  def guess_again
    @guess_count += 1
    if @guess_count <= 12
      player_number
      check_match
      output_numbers
    else
      puts 'You have used all 12 of your guesses and lose!'
      play_again
    end
  end

  def play_start
    @guess_count += 1
    computer_random_numbers
    player_number
    output_numbers
    check_match
  end
end

game = Main.new
game.play_start
