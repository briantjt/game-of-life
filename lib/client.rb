require_relative 'commands'

class Client
  def new_game(command)
    command.execute
  end
end
