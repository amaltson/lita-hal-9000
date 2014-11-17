module Lita
  module Handlers
    class Hal9000 < Handler
      on(:unhandled_message) do |payload|
        message = payload[:message]
        return unless message.command?
        target = Source.new(room: payload[:room], private_message: message.source.private_message)
        robot.send_message(target, "I'm sorry, I can't do that #{message.user}. http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/HAL9000.svg/200px-HAL9000.svg.png")
      end
    end

    Lita.register_handler(Hal9000)
  end
end
