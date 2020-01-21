class Mail < ApplicationRecord
  validates :template_id, presence: true
  validates :subject, presence: true
  validates :to, presence: true
  validates :from, presence: true
  has_one :variable
end
