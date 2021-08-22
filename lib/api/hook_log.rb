module Api
  class HookLog
    HOOK_LOG_FILENAME = "hook.log".freeze

    class << self
      def write type, msg
        logger.send type, msg
      end

      def logger
        log_root = Rails.root.join "log"
        log_file = File.join(log_root, HOOK_LOG_FILENAME)
        Logger.new(log_file)
      end
    end
  end
end
