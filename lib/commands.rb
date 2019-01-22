require_relative './mutable/game_mutable.rb'
require_relative './immutable/world_immutable.rb'
require_relative './multi/world_multi.rb'
require_relative './shared/game_shared.rb'

class Command
  def initialize(size)
    @size = size
  end
end

class StartMutable < Command
  def execute
    GameMutable.new(@size).start
  end
end

class StartMulti < Command
  def execute
    GameShared.new(@size).start(WorldMulti)
  end
end

class StartImmutable < Command
  def execute
    GameShared.new(@size).start(WorldImmutable)
  end
end
