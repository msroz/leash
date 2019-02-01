require "spec_helper"

describe Rest::Views::ApplicationLayout do
  let(:layout)   { Rest::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    rendered.must_include('Rest')
  end
end
