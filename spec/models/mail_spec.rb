require 'rails_helper'

RSpec.describe Mail, type: :model do
  context 'validations' do
    subject { create(:mail) }

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'has no empty subject' do
      expect(subject.subject).not_to be_empty
    end

    it 'is not valid without a subject' do
      subject.subject = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a to' do
      subject.to = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a from' do
      subject.from = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a to' do
      subject.template_id = nil
      expect(subject).to_not be_valid
    end
  end
end
