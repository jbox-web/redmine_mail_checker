## Redmine Mail Checker Plugin

[![Code Climate](https://codeclimate.com/github/jbox-web/redmine_mail_checker.png)](https://codeclimate.com/github/jbox-web/redmine_mail_checker)
[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FBT7E7DAVVEEU)

## A Redmine plugin to check your mails.

This plugin replaces Redmine rake task to check mails.

## Why?

Running periodicaly ```bundle exec rake redmine:email:receive_imap``` to check your mails leads to high memory consumption : Redmine is loaded twice : once for your webserver and once for the cron task.
This is not very efficient : for VPS with small memory size this can lead to memory saturation and the intervention of the OOM Killer who will kill the job.

Instead, install this plugin and enable WS for mail reception (in *Administration -> Settings -> Incoming emails*) and generate an API key.

Then configure your crontab to call a specific url to trigger mailbox check instead of ```bundle exec rake redmine:email:receive_imap```

    curl https://redmine.example.net/check_mails?key=<API_KEY>

## Copyrights & License

Redmine Mail Checker is completely free and open source and released under the [MIT License](https://github.com/jbox-web/redmine_mail_checker/blob/devel/LICENSE).

Copyright (c) 2015 Nicolas Rodriguez (nrodriguez@jbox-web.com), JBox Web (http://www.jbox-web.com) [![endorse](https://api.coderwall.com/n-rodriguez/endorsecount.png)](https://coderwall.com/n-rodriguez)

## Contribute

You can contribute to this plugin in many ways such as :
* Helping with documentation
* Contributing code (features or bugfixes)
* Reporting a bug
* Submitting translations

You can also donate :)

[![Donate](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=FBT7E7DAVVEEU)
