#!/usr/bin/env ruby

require "nagios_check"
require 'open3'
require 'optparse'
require 'time'
require 'active_support/core_ext'

require "openvpn_cert_nagios/shell"
require "openvpn_cert_nagios/certs"
require "openvpn_cert_nagios/check"
