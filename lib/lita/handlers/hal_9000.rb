module Lita
  module Handlers
    class Hal9000 < Handler
      config :hal_image, default: 'http://bit.ly/1SHSAcQ'

      on(:unhandled_message) do |payload|
        handle_unhandled(payload: payload)
      end

      def handle_unhandled(payload:)
        message = payload[:message]
        if should_reply?(message: message)
          target = reply_target(message: message)
          robot.send_message(target, format_reply(
            message: message))
        end
      end

      def should_reply?(message:)
        message.command? && message.match(/^@#{robot.name}/)
      end

      def reply_target(message:)
        if message.source.private_message
          Source.new(user: message.user, private_message: true)
        else
          Source.new(room: message.source.room)
        end
      end

      def format_reply(message:)
        "I'm sorry, I can't do that @#{message.user.mention_name} " +
          config.hal_image
      end

    end

    Lita.register_handler(Hal9000)
  end
end
