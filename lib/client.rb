require 'socket.io-client-simple'
require 'api'
require 'logger'
require 'yaml'

module Client
  # See lib/socket.io-client-simple/client.rb:120
  Struct.new("ClientParams", :socket, :url, :user_id, :username, :game_id, :keep_running)
  def self.configure(url:, user_id:, username:, game_id:)
    socket = SocketIO::Client::Simple.connect(url)
    @@config = Struct::ClientParams.new(socket, url, user_id, username, game_id, true)

    bot_filename = YAML.load(IO.read('./config.yml'))['bot_filename']
    require_relative(bot_filename)
  end

  def self.config
    @@config
  end

  def self.join_game!(socket)
    API.send('join_private', socket, config.game_id, config.user_id)
    API.send('set_force_start', socket, config.game_id, true)
  end

  def self.connect
    config.socket.on :connect do
      config = Client.config

      Logger.log 'connect'
      API.send('set_username', self, config.user_id, "[Bot] #{config.username}")
      Client.join_game!(self)
    end

    config.socket.on :disconnect do |client = self|
      Logger.log 'disconnect'
      client.stop!
    end

    config.socket.on :error do |err|
      Logger.log "Error: #{err.inspect}"
      Logger.log err.backtrace.join("\n#{' ' * 27}")
    end

    config.socket.on :error_set_username do |err|
      Logger.log "Error setting username: #{err.inspect}"
    end

    config.socket.on :game_start do |data|
      Logger.log "SER game_start: #{data.inspect}"
      BotInterface.start(data)
    end

    config.socket.on :game_update do |data|
      Logger.log "SER game_update: #{data.inspect}"
      attack = BotInterface.update(data)
      API.send('attack', socket, attack.to_args) unless attack.nil?
    end

    config.socket.on :game_lost do |data|
      Logger.log "SER game_lost: #{data.inspect}"
      BotInterface.game_over(data)
      API.send('leave_game', self)
      Client.join_game!(self)
    end

    config.socket.on :game_won do |data|
      Logger.log "SER game_won: #{data.inspect}"
      BotInterface.game_over(:win)
      API.send('leave_game', self)
      Client.join_game!(self)
    end

    config.socket.on :chat_message do |data|
      Logger.log "SER chat_message: #{data.inspect}"
    end

    config.socket.on :stars do |data|
      Logger.log "SER stars: #{data.inspect}"
    end

    config.socket.on :rank do |data|
      Logger.log "SER rank: #{data.inspect}"
    end
  end
end
