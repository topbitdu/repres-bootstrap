class PlatformModuleName::VersionModuleName::PrivilegedController < ApplicationController

  layout  'platform_name/version_name'

  include PriviledgeProtection

  helper  PlatformModuleName::VersionModuleName::Helper

end
