#! /usr/bin/env ruby
#
#   check-load
#
# DESCRIPTION:
#
# OUTPUT:
#   plain text
#
# PLATFORMS:
#   Linux, BSD, Solaris, etc
#
# DEPENDENCIES:
#   gem: sensu-plugin
#
# USAGE:
#   ./bin/check-load.rb --help
# NOTES:
#
# LICENSE:
#   Copyright 2012 Sonian, Inc <chefs@sonian.net>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/check/cli'
require_relative '../lib/sensu-plugins-load-checks/load-average.rb'

class CheckLoad < Sensu::Plugin::Check::CLI
  option :warn,
         short: '-w L1,L5,L15',
         long: '--warn L1,L5,L15',
         description: 'Load WARNING threshold, 1/5/15 min average',
         proc: proc { |a| a.split(',').map(&:to_f) },
         default: [2.75, 2.5, 2.0]

  option :crit,
         short: '-c L1,L5,L15',
         long: '--crit L1,L5,L15',
         description: 'Load CRITICAL threshold, 1/5/15 min average',
         proc: proc { |a| a.split(',').map(&:to_f) },
         default: [3.5, 3.25, 3.0]

  def run
    data = LoadAverage.new
    unknown 'Could not read load average from /proc or `uptime`' if data.failed?

    message "Per core load average (#{data.cpu_count} CPU): #{data.load_avg}"

    critical if data.exceed?(config[:crit])
    warning if data.exceed?(config[:warn])
    ok
  end
end
