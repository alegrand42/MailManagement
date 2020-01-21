require 'rails_helper'

RSpec.describe Variable, type: :model do
  context 'validations' do
    let(:mail) { create(:mail)}
    subject { create(:variable, mail: mail) }

    it 'is valid' do
      expect(subject).to be_valid
    end
  end
end
