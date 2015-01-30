require 'logger'

module RedmineMailChecker
  class Log < Logger

    class << self

      def init_logs!
        logfile = Rails.root.join('log', 'mail_checker.log')
        logger = new(logfile)
        logger.progname = 'RedmineMailChecker'
        logger.level = Logger::INFO
        logger.formatter = proc do |severity, time, progname, msg|
          "#{time} [#{severity}] #{msg}\n"
        end
        logger
      end

    end

  end
end
