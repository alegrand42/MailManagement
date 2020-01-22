class Mailguns

  def self.send_message(params)
    @mg_client = Mailgun::Client.new ENV['MAILGUN_API_KEY']
    data = Mails.fetch_show(params)

    message_params =  { from: data['from'],
                           to: data['to'],
                           subject: data['subject'],
                           text: data['code']
                     }
   
    result = @mg_client.send_message(ENV['MAILGUN_DOMAIN'], message_params).to_h!
    message = result['message']
  end
end
