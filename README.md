## Redmine Mail Checker Plugin

[![GitHub license](https://img.shields.io/github/license/jbox-web/redmine_mail_checker.svg)](https://github.com/jbox-web/redmine_mail_checker/blob/devel/LICENSE)
[![GitHub release](https://img.shields.io/github/release/jbox-web/redmine_mail_checker.svg)](https://github.com/jbox-web/redmine_mail_checker/releases/latest)
[![Code Climate](https://codeclimate.com/github/jbox-web/redmine_mail_checker.png)](https://codeclimate.com/github/jbox-web/redmine_mail_checker)

## A Redmine plugin to check your mails.

This plugin replaces Redmine rake task to check mails.

## Why?

Running periodicaly ```bundle exec rake redmine:email:receive_imap``` to check your mails leads to high memory consumption : Redmine is loaded twice, once for your webserver and once for the cron task.
This is not very efficient : for VPS with small memory size this can lead to memory saturation and the intervention of the OOM Killer who will kill the job.

## Installation

**1)** Install this plugin with git clone


    redmine$ cd REDMINE_ROOT/plugins
    redmine$ git clone https://github.com/jbox-web/redmine_mail_checker.git
    redmine$ cd redmine_mail_checker/
    redmine$ git checkout 1.0.0

*No need of db:migrate or bundle update, just restart Redmine.*

**2)** Enable WS for mail reception (in *Administration -> Settings -> Incoming emails*) and generate an API key.

**3)** Configure your mailbox settings (in *Administration -> Plugins -> Configure*)

**4)** Then configure your crontab to call a specific url to trigger mailbox check instead of ```bundle exec rake redmine:email:receive_imap```

    curl http://redmine.example.net/check_mails?key=<API_KEY>


That's all!

## Contribute

You can contribute to this plugin in many ways such as :
* Helping with documentation
* Contributing code (features or bugfixes)
* Reporting a bug
* Submitting translations
