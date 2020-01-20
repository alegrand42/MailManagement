require 'rails_helper'

RSpec.describe Template, type: :model do
  context 'validations' do
    subject { create(:template) }

    it 'is valid' do
      expect(subject).to be_valid
    end

    it 'has no empty code' do
      expect(subject.code).not_to be_empty
    end

    it 'is not valid without a code' do
      subject.code = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a mail' do
      subject.mail = nil
      expect(subject).to_not be_valid
    end
  end
end
