class MailCheckerController < ApplicationController
  unloadable

  skip_before_filter :verify_authenticity_token
  skip_before_filter :check_if_login_required

  before_filter :check_credential

  accept_api_auth :index


  def index
    if protocol == 'imap'
      method = :check_imap_mails
    else
      method = :check_pop_mails
    end

    RedmineMailChecker.logger.info("Checking #{protocol.upcase} mails")

    begin
      self.send(method)
    rescue Exception => e
      RedmineMailChecker.logger.error(e.message)
    else
      RedmineMailChecker.logger.info('Done!')
    end

    render nothing: true
  end


  private


    def protocol
      RedmineMailChecker.get_setting(:protocol)
    end


    def check_credential
      User.current = nil
      unless Setting.mail_handler_api_enabled? && params[:key].to_s == Setting.mail_handler_api_key
        render text: 'Access denied. Incoming emails WS is disabled or key is invalid.', status: 403
      end
    end


    def check_imap_mails
      Redmine::IMAP.check(common_options.merge(imap_options), MailHandler.extract_options_from_env(redmine_options))
    end


    def check_pop_mails
      Redmine::POP3.check(common_options.merge(pop_options), MailHandler.extract_options_from_env(redmine_options))
    end


    def common_options
      {
        :host     => RedmineMailChecker.get_setting(:host),
        :port     => RedmineMailChecker.get_setting(:port).to_i,
        :ssl      => RedmineMailChecker.get_setting(:ssl, true),
        :username => RedmineMailChecker.get_setting(:username),
        :password => RedmineMailChecker.get_setting(:password)
      }
    end


    def imap_options
      options = {}
      options[:folder]          = !imap_folder.empty? ? imap_folder : nil
      options[:move_on_success] = RedmineMailChecker.get_setting(:move_on_success)
      options[:move_on_failure] = RedmineMailChecker.get_setting(:move_on_failure)
      options
    end


    def imap_folder
      RedmineMailChecker.get_setting(:folder)
    end


    def pop_options
      options = {}
      options[:apop] = RedmineMailChecker.get_setting(:apop, true),
      options[:delete_unprocessed] = RedmineMailChecker.get_setting(:delete_unprocessed, true)
      options
    end


    def redmine_options
      options = {}
      options['project']        = RedmineMailChecker.get_setting(:project)
      options['allow_override'] = RedmineMailChecker.get_setting(:allow_override)
      options
    end

end
