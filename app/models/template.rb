class Template < ApplicationRecord
  validates :code, uniqueness: true, presence: true
  validates :mail, uniqueness: true, presence: true

  def self.generate(code, mail)
    return unless code || mail
    Template.find_or_create_by(code: code, mail: mail)
  end
end
