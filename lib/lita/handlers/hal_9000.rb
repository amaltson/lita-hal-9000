module Lita
  module Handlers
    class Hal9000 < Handler
      on(:unhandled_message) do |payload|
        handle_unhandled(payload: payload)
      end

      def handle_unhandled(payload:)
        message = payload[:message]
        if message.command?
          target = reply_target(message: message)
          robot.send_message(target, "I'm sorry, I can't do that @#{message.user.mention_name} http://bit.ly/11wwIP2")
        end
      end

      def reply_target(message:)
        if message.source.private_message
          Source.new(user: message.user, private_message: true)
        else
          Source.new(room: message.source.room)
        end
      end

    end

    Lita.register_handler(Hal9000)
  end
end
