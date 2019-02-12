require "spec_helper"

RSpec.describe Graph::Views::ApplicationLayout, type: :view do
  let(:layout)   { Graph::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/graph/templates/application.html.erb') }

  it 'contains application name' do
    expect(rendered).to include('Graph')
  end
end
