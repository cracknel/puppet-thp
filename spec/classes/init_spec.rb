require 'spec_helper'

describe 'thp' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_service('disable-thp') }
      it { is_expected.to contain_file('/etc/systemd/system/disable-thp.service') }
      it { is_expected.to contain_exec('verify-thp-disabled') }
    end
  end
end
