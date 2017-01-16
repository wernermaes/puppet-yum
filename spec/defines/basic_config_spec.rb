require 'spec_helper'

describe 'yum::config' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        let(:pre_condition) { [ 'include ::yum', ] }

        context 'ensure => "1, 2"' do
          let(:title)  { 'exclude' }
          let(:params) { { ensure: '1, 2' } }
          it { is_expected.to contain_yum__config('exclude').with(
            :ensure => '1, 2'
          ) }
        end
      end
    end
  end

end
