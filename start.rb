$LOAD_PATH.unshift('lib')
require 'client'

unless ARGV.length == 3
  puts "Usage:"
  puts "  ruby start <user_id> <username> <game_id>"
  exit 1
end

user_id, username, game_id = ARGV.shift(3)
Client.configure(
  url: 'http://botws.generals.io',
  user_id: user_id,
  username: username,
  game_id: game_id
)

Client.connect

while Client.config.keep_running
  begin
    sleep 5
  rescue Interrupt
    puts "Closing client ..."
    Client.config.keep_running = false
  end
end
