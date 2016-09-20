## Sensu-Plugins-load-checks

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-load-checks.svg)](http://badge.fury.io/rb/sensu-plugins-load-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks)

## Functionality

## Files
 * bin/check-load.rb
 * bin/metrics-load.rb

## Usage

### check-load.rb

To see the list of full options you can run:
```
$ ./bin/check-load.rb --help
Usage: ./bin/check-load.rb (options)
    -c, --crit L1,L5,L15             Load CRITICAL threshold, 1/5/15 min average
    -p, --per-core                   Divide load average results by cpu/core count
    -w, --warn L1,L5,L15             Load WARNING threshold, 1/5/15 min average
```

This check will only work on linux systems as it relies on `cat /proc/loadavg` and `cat /proc/cpuinfo`. The check now defaults to using the `per_core` option which will take the loadavg and divide by the number of cores. You can use `-w/-c` with a comma separated value for 1/5/15 minute thresholds.


## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
