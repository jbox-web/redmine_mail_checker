# Set up autoload of patches
Rails.configuration.to_prepare do

  rbfiles = Rails.root.join('plugins', 'redmine_mail_checker', 'lib', 'redmine_mail_checker', '**', '*.rb')
  Dir.glob(rbfiles).each do |file|
    require_dependency file
  end

end


module RedmineMailChecker

  class << self

    def logger
      @logger ||= RedmineMailChecker::Log.init_logs!
    end


    def get_setting(setting, bool = false)
      if bool
        return_bool Setting.plugin_redmine_mail_checker[setting]
      else
        return Setting.plugin_redmine_mail_checker[setting]
      end
    end


    private


      def return_bool(value)
        value == 'true' ? true : false
      end

  end

end
