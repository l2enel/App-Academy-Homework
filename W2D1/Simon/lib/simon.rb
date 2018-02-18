require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    # debugger
      show_sequence
      require_sequence
      if game_over == false
        round_success_message
        @sequence_length += 1
      end
  end

  def show_sequence
    add_random_color

    puts "#{self.seq}"
    sleep(3)
    system('clear')

  end

  def require_sequence
    puts "please enter all the colors of the sequence"
    puts "(red, blue, green, yellow)"
    answer = gets.chomp.split

    if answer == self.seq
      self.game_over = false
    else
      self.game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Successful round!"
  end

  def game_over_message
    puts "Game Over"
    puts "sequence: #{self.seq}"
    puts "sequence length : #{self.sequence_length}"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  Simon.new.play
end
