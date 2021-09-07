require 'rails_helper' 

RSpec.describe 'Test spec' do           #
    context 'test context' do  # (almost) plain English
      it 'test asser' do   #
        expect(1.nil?).to eq(false)
      end
    end
  end