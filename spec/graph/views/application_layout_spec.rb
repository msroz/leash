require "spec_helper"

describe Graph::Views::ApplicationLayout do
  let(:layout)   { Graph::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    rendered.must_include('Graph')
  end
end
