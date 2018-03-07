#! /usr/bin/env ruby

#
# DESCRIPTION:
#   This plugin uses uptime to collect load metrics
#   Basically copied from sensu-community-plugins/plugins/system/vmstat-metrics.rb
#
#   Load per processor
#   ------------------
#
#   The number of CPUs is determined by reading `/proc/cpuinfo`. This makes the
#   feature Linux specific. Other OSs can be supported by adding OS # detection
#   and a method to determine the number of CPUs.
#
# OUTPUT:
#   metric data
#
# PLATFORMS:
#   Linux, BSD, Solaris, etc
#
# DEPENDENCIES:
#   gem: sensu-plugin
#   gem: socket
#
# USAGE:
#
# NOTES:
#
# LICENSE:
#   Copyright 2012 Sonian, Inc <chefs@sonian.net>
#   Released under the same terms as Sensu (the MIT license); see LICENSE
#   for details.
#

require 'sensu-plugin/metric/cli'
require_relative '../lib/sensu-plugins-load-checks/load-average.rb'
require 'socket'

class LoadStat < Sensu::Plugin::Metric::CLI::Graphite
  option :scheme,
         description: 'Metric naming scheme, text to prepend to .$parent.$child',
         long: '--scheme SCHEME',
         default: Socket.gethostname.to_s

  def run
    data = LoadAverage.new
    unknown 'Could not read load average from /proc or `uptime`' if data.failed?

    timestamp = Time.now.to_i
    metrics = {
      load_avg: {
        one: data.load_avg[0].round(2),
        five: data.load_avg[1].round(2),
        fifteen: data.load_avg[2].round(2)
      }
    }

    metrics.each do |parent, children|
      children.each do |child, value|
        output [config[:scheme], parent, child].join('.'), value, timestamp
      end
    end
    ok
  end
end
