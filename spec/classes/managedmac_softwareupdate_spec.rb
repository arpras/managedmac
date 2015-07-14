require 'spec_helper'

describe 'managedmac::softwareupdate', :type => 'class' do

  context "when setting $catalog_url" do
    context "when undef" do
      let(:params) do
        { :catalog_url  => '' }
      end
      it { should contain_mobileconfig('managedmac.softwareupdate.alacarte')\
        .with_ensure('absent') }
    end
    context "when not a URL-like" do
      let(:params) do
        { :catalog_url => 'foo' }
      end
      it { should raise_error(Puppet::Error, /does not match/) }
    end
    context "when a URL" do
      let(:params) do
        { :catalog_url => 'http://foo.bar.com/foo.sucatalog' }
      end
      it { should contain_mobileconfig('managedmac.softwareupdate.alacarte')\
        .with_ensure('present') }
    end
  end

  context "when setting $allow_pre_release_installation" do
    context "when undef" do
      let(:params) do
        { :allow_pre_release_installation  => '' }
      end
      it { should contain_mobileconfig('managedmac.softwareupdate.alacarte')\
        .with_ensure('absent') }
    end
    context "when not Boolean" do
      let(:params) do
        { :allow_pre_release_installation => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a Boolean" do
      let(:params) do
        { :allow_pre_release_installation => false }
      end
      it { should contain_mobileconfig('managedmac.softwareupdate.alacarte')\
        .with_ensure('present') }
    end
  end

  context "when setting $automatic_update_check" do
    context "when a undef" do
      let(:params) do
        { :automatic_update_check => '' }
      end
      it { should_not contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist') }
    end
    context "when not a boolean" do
      let(:params) do
        { :automatic_update_check => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a boolean" do
      let(:params) do
        { :automatic_update_check => true }
      end
      it { should contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist')
        .with_ensure('present') }
    end
  end

  context "when setting $automatic_download" do
    context "when a undef" do
      let(:params) do
        { :automatic_download => '' }
      end
      it { should_not contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist') }
    end
    context "when not a boolean" do
      let(:params) do
        { :automatic_download => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a boolean" do
      let(:params) do
        { :automatic_download => true }
      end
      it { should contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist')
        .with_ensure('present') }
    end
  end

  context "when setting $config_data_install" do
    context "when a undef" do
      let(:params) do
        { :config_data_install => '' }
      end
      it { should_not contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist') }
    end
    context "when not a boolean" do
      let(:params) do
        { :config_data_install => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a boolean" do
      let(:params) do
        { :config_data_install => true }
      end
      it { should contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist')
        .with_ensure('present') }
    end
  end

  context "when setting $critical_update_install" do
    context "when a undef" do
      let(:params) do
        { :critical_update_install => '' }
      end
      it { should_not contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist') }
    end
    context "when not a boolean" do
      let(:params) do
        { :critical_update_install => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a boolean" do
      let(:params) do
        { :critical_update_install => true }
      end
      it { should contain_propertylist('/Library/Preferences/com.apple.SoftwareUpdate.plist')
        .with_ensure('present') }
    end
  end

  context "when setting $auto_update_apps" do
    context "when a undef" do
      let(:params) do
        { :auto_update_apps => '' }
      end
      it { should_not contain_propertylist('/Library/Preferences/com.apple.storeagent.plist') }
    end
    context "when not a boolean" do
      let(:params) do
        { :auto_update_apps => 'foo' }
      end
      it { should raise_error(Puppet::Error, /not a boolean/) }
    end
    context "when a boolean" do
      let(:params) do
        { :auto_update_apps => true }
      end
      it { should contain_propertylist('/Library/Preferences/com.apple.storeagent.plist')
        .with_ensure('present') }
    end
  end

end
