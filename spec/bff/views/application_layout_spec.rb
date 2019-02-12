require "spec_helper"

describe Bff::Views::ApplicationLayout do
  let(:layout)   { Bff::Views::ApplicationLayout.new({ format: :html }, "contents") }
  let(:rendered) { layout.render }

  it 'contains application name' do
    rendered.must_include('Bff')
  end
end
