class Game

  def initialize
    @action = 0
    @last_action = @action
  end

  public
  # displays home screen, only shown once at the beginning of the game
  def show_home_screen

    # game display
    Screen.show_game_intro
    Screen.show_home_menu

    start_game_loop
  end

  private

  #starts the game loop
  def start_game_loop

    until @last_action == 3
      get_user_action

      case @action
        when 1 then
        when 2 then
        when 3 then exit
      end
    end

  end

  # action local variable
  def action=(action)

    # add validation
    if(![1,2,3].include?(action.to_i))
      raise ArgumentError.new("Invalid input : '#{action}'")
    end

    # todo add validation later
    @last_action = @action = action.to_i
  end

  def get_user_action
    response = gets.chomp
    self.action = response
  end

  # start the game mode 1
  def start_as_guesser
  end

  # start the game mode 2
  def start_as_coder
  end

  # exit the game
  def exit
    Screen.show_goodbye
  end

  class Screen

    # show game intro menu
    def self.show_game_intro
      puts %{
  ===========================================
     MASTERMIND : By Sava & Kevin
  ===========================================
  Welcome to Mastermind!
  You shall not pass on the first try 😈
      }
    end

    # displays menu options
    def self.show_home_menu
      print %{
    1. Break the code
    2. Create the unbreakable code
    3. Take the red pill (Quit)

  So, what will it be?
  (Enter an option 1,2 or 3): }
    end

    # show winning screen
    def self.show_win
    end

    # show game over screen
    def self.show_game_over
    end

    def self.show_goodbye
      puts %{
You ran away. We won't judge you, but come back for another challenge later.
      }
    end

  end
end
