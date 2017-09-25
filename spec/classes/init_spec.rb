require 'spec_helper'
describe 'puppet_syntax_vim' do
  context 'with default values for all parameters' do
    it { should contain_class('puppet_syntax_vim') }
  end
end
