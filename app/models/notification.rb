module Notification

    def self.notify_creation(article, current_user)
      message = "User <b>#{current_user.name}</b> has created a new record <i>#{article.title}</i> on <b>HackerFeed</b>, with the <a href='http://hfeed.herokuapp.com/'>link</a>"
      client = HipChat::Client.new(ENV['HIPCHAT'])
      client['MRoom'].send('HFeed', message, :color => 'green', :message_format => 'html', :notigy => true)
    end

end