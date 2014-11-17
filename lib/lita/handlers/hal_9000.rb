module Lita
  module Handlers
    class Hal9000 < Handler
      on(:unhandled_message) do |payload|
        message = payload[:message]
        if message.command?
          private_message = message.source.private_message
          target = unless private_message
                     Source.new(room: message.source.room)
                   else
                     Source.new(user: message.user, private_message: true)
                   end
          robot.send_message(target, "I'm sorry, I can't do that #{message.user.mention_name}. http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/HAL9000.svg/200px-HAL9000.svg.png")
        end
      end
    end

    Lita.register_handler(Hal9000)
  end
end
