require 'rails_helper'

RSpec.describe Mails, type: :services do

  describe '#build' do
    let(:params) do
      {
        'subject' => Faker::TvShows::DrWho.catch_phrase,
        'template_id' => '1',
        'to' => Faker::TvShows::DrWho.character,
        'from' => Faker::TvShows::DrWho.the_doctor,
        'court_date' => Faker::Date.between(from: 2.days.ago, to: Date.today).to_s,
        'civility' => Faker::TvShows::DrWho.the_doctor,
        'denomination' => Faker::TvShows::DrWho.character
      }
    end

    context 'with params' do
      it 'return the if of the mail created' do
        expect(Mails.build(params)).to eq(1)
      end
    end
  end

  describe '#fetch_show' do
    let(:mail) { create(:mail)}

    context 'display' do
      it 'contains mail data' do
        show = Mails.fetch_show( { 'id' => mail.id })
        expect(show['to']).to eq(mail.to)
        expect(show['subject']).to eq(mail.subject)
      end
    end
  end

  describe '#gather_all' do
    context 'with no mail' do
      it 'returns an empty array' do
        gather = Mails.gather_all
        expect(gather).to eq([])
      end
    end
  end
end
