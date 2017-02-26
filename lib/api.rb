require_relative './logger'

module API
  def self.send(event, socket, *args)
    socket.emit(event, *args)
    Logger.log "CLI #{event}: #{args.inspect}"
  end
end
