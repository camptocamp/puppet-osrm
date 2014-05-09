require 'spec_helper'

describe 'osrm' do
  let(:facts) {{
    :lsbdistcodename => 'wheezy',
  }}
  it { should compile.with_all_deps }
end
