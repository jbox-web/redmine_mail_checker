# coding: utf-8

require 'redmine'

require 'redmine_mail_checker'

Redmine::Plugin.register :redmine_mail_checker do
  name 'Redmine Mail Checker'
  author 'Nicolas Rodriguez'
  description 'Replace redmine:email:receive_imap Rake task by a webservice'
  version '1.0.0'
  url 'https://github.com/jbox-web/redmine_mail_checker'
  author_url 'https://github.com/jbox-web'

  settings({
    :partial => 'settings/redmine_mail_checker',
    :default => {
      # Common options
      :protocol       => 'imap',
      :host           => 'mail.example.net',
      :port           => '993',
      :ssl            => 'true',
      :username       => '',
      :password       => '',

      # IMAP options
      :folder          => '',
      :move_on_success => '',
      :move_on_failure => '',

      # POP options
      :apop               => 'false',
      :delete_unprocessed => 'false',

      # Redmine options
      :project        => '',
      :allow_override => ''
    }
  })
end
