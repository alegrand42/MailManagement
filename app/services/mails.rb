class Mails
  MAIL_ATTR = %w{subject to from template_id}.freeze
  VARIABLES = %w{court_date civility denomination}.freeze

  def self.gather_data params
    mail = Mail.find_or_create_by(fetch_attributes(params))
    return unless mail
    #Variable.find_or_create_by fetch_variables(params, mail.id)
    # send mail and update deliver_at
    mail.id
  end

  def self.get_mail_data(params)
    Mail.find_by(id: params['id'])
  end

  def self.get_all_mails_data
    Mail.includes(:variables).to_a
  end

  private

  def self.fetch_attributes(params)
    {}.tap do |hash|
      MAIL_ATTR.each do |attr|
        hash[attr] = params[attr].strip if params[attr]
      end
    end
  end

  def self.fetch_variables(params, mail_id)
    {}.tap do |hash|
      VARIABLES.each do |attr|
        hash[attr] = params[attr].strip if params[attr]
      end
      hash['mail'] = "#{mail_id}"
    end
  end
end
