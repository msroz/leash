require_relative '../../../spec_helper'

RSpec.describe Rest::Controllers::Users::Create, type: :controller do
  let(:action) { Rest::Controllers::Users::Create.new }
  let(:params) { Hash[] }

  it 'is failed' do
    response = action.call(params)
    expect(response[0]).to eq 422
  end
end
