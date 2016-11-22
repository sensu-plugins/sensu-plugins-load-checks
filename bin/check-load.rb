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

class LoadAverage
  def initialize(per_core = true)
    @cores = per_core ? cpu_count : 1
    @avg = loadavg.map { |a| (a.to_f / @cores).round(2) } rescue nil # rubocop:disable RescueModifier
  end

  def load_avg
    if File.exist?('/proc/loadavg')
      File.read('/proc/loadavg').split.take(3)
    else
      `uptime`.delete(',').split(' ')[-3..-1]
    end
  end

  def cpu_count
    if File.exist?('/proc/cpuinfo')
      File.read('/proc/cpuinfo').scan(/^processor/).count
    else
      `sysctl -n hw.ncpu`.to_i
    end
  rescue
    0
  end

  def failed?
    @avg.nil? || @cores.zero?
  end

  def exceed?(thresholds)
    @avg.zip(thresholds).any? { |a, t| a >= t }
  end

  def to_s
    @avg.join(', ')
  end
end

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

  option :per_core,
         short: '-p',
         long: '--per-core',
         description: 'Divide load average results by cpu/core count',
         boolean: 'true',
         default: true

  def run
    avg = LoadAverage.new(config[:per_core])
    unknown 'Could not read load average from /proc' if avg.failed?
    message "Load average: #{avg}"
    critical if avg.exceed?(config[:crit])
    warning if avg.exceed?(config[:warn])
    ok
  end
end
