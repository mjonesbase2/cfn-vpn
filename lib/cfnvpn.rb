require 'thor'
require 'cfnvpn/version'
require 'cfnvpn/actions/init'
require 'cfnvpn/actions/modify'
require 'cfnvpn/actions/config'
require 'cfnvpn/actions/client'
require 'cfnvpn/actions/revoke'
require 'cfnvpn/actions/sessions'
require 'cfnvpn/actions/routes'
require 'cfnvpn/actions/share'
require 'cfnvpn/actions/embedded'
require 'cfnvpn/actions/subnets'

module CfnVpn
  class Cli < Thor

    map %w[--version -v] => :__print_version
    desc "--version, -v", "print the version"
    def __print_version
      puts CfnVpn::VERSION
    end

    register CfnVpn::Actions::Init, 'init', 'init [name]', 'Create a AWS Client VPN'
    tasks["init"].options = CfnVpn::Actions::Init.class_options

    register CfnVpn::Actions::Modify, 'modify', 'modify [name]', 'Modify your AWS Client VPN'
    tasks["modify"].options = CfnVpn::Actions::Modify.class_options

    register CfnVpn::Actions::Config, 'config', 'config [name]', 'Retrieve the config for the AWS Client VPN'
    tasks["config"].options = CfnVpn::Actions::Config.class_options

    register CfnVpn::Actions::Client, 'client', 'client [name]', 'Create a new client certificate'
    tasks["client"].options = CfnVpn::Actions::Client.class_options

    register CfnVpn::Actions::Revoke, 'revoke', 'revoke [name]', 'Revoke a client certificate'
    tasks["revoke"].options = CfnVpn::Actions::Revoke.class_options

    register CfnVpn::Actions::Sessions, 'sessions', 'sessions [name]', 'List and kill current vpn connections'
    tasks["sessions"].options = CfnVpn::Actions::Sessions.class_options

    register CfnVpn::Actions::Routes, 'routes', 'routes [name]', 'List, add or delete client vpn routes'
    tasks["routes"].options = CfnVpn::Actions::Routes.class_options

    register CfnVpn::Actions::Share, 'share', 'share [name]', 'Provide a user with a s3 signed download for certificates and config'
    tasks["share"].options = CfnVpn::Actions::Share.class_options

    register CfnVpn::Actions::Embedded, 'embedded', 'embedded [name]', 'Embed client certs into config and generate S3 presigned URL'
    tasks["embedded"].options = CfnVpn::Actions::Embedded.class_options

    register CfnVpn::Actions::Subnets, 'subnets', 'subnets [name]', 'Manage subnet associations for the client vpn'
    tasks["subnets"].options = CfnVpn::Actions::Subnets.class_options

  end
end
