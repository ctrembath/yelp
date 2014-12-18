require 'rails_helper'

describe ReviewsHelper, :type => :helper do
  context '#star rating' do
    it 'does nothing for not a number' do
      expect(helper.star_rating('N/A')).to eq ('N/A')
    end
  end
end