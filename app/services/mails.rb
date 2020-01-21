class Mails
  MAIL_ATTR = %w{subject to from template_id}.freeze
  VARIABLES = %w{court_date civility denomination}.freeze

  def self.build params
    mail = Mail.find_or_create_by(fetch_attributes(params))
    return unless mail
    Variable.find_or_create_by(fetch_variables(params, mail.id))
    # send mail and update deliver_at
    mail.id
  end

  def self.fetch_show(params)
    display_single(params['id'])
  end

  def self.gather_all
    Mail.includes(:variable).to_a
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
      hash['mail_id'] = "#{mail_id}"
    end
  end

  def self.display_single mail_id
    mail = Mail.find_by(id: mail_id)
    return unless mail
    variables = gather_variables(mail.id)

    {}.tap do |hash|
      MAIL_ATTR.each do |attr|
        hash[attr] = mail[attr] if attr != 'template_id'
      end
      hash['code'] = fetch_code(mail.template_id, variables)
      hash['variables'] = variables
    end
  end

  def self.fetch_code(template_id, variables)
    template = Template.find_by(id: template_id)
    return unless template
    return template.mail unless variables

    replace = all_replace(variables) 
    replace.each do |rep|
      template.mail.gsub!(rep[0], rep[1]) unless rep[1].nil?
    end
    template.mail
  end

  def self.gather_variables(mail_id)
    #model
    variables = Variable.find_by(mail_id: mail_id)
    return unless variables

    {
      court_date: variables[:court_date],
      civility: variables[:civility],
      denomination: variables[:denomination]
    }
  end

  def self.all_replace(variables)
    [
      ['<court_date>', variables[:court_date].to_s],
      ['<civility>', variables[:civility]],
      ['<denomination>', variables[:denomination]]
    ]
  end
end
