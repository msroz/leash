require_relative '../../../spec_helper'

describe Rest::Views::Users::Create do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/rest/templates/users/create.html.erb') }
  let(:view)      { Rest::Views::Users::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format' do
    view.format.must_equal exposures.fetch(:format)
  end
end