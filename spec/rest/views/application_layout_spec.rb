require "spec_helper"

RSpec.describe Rest::Views::ApplicationLayout, type: :view do
  let(:layout)   { Rest::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/rest/templates/application.html.erb') }

  it 'contains application name' do
    expect(rendered).to include('Rest')
  end
end
