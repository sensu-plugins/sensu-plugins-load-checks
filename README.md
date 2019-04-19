## Sensu-Plugins-load-checks

[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-load-checks.svg)](http://badge.fury.io/rb/sensu-plugins-load-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks)
[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-load-checks)

## Sensu Asset  
  The Sensu assets packaged from this repository are built against the Sensu ruby runtime environment. When using these assets as part of a Sensu Go resource (check, mutator or handler), make sure you include the corresponding Sensu ruby runtime asset in the list of assets needed by the resource.  The current ruby-runtime assets can be found [here](https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime) in the [Bonsai Asset Index](bonsai.sensu.io).

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
    -w, --warn L1,L5,L15             Load WARNING threshold, 1/5/15 min average
```

This check should work on linux systems and many other unix systems. The check takes the loadavg and divide by the number of cores. You can use `-w/-c` with a comma separated value for 1/5/15 minute thresholds.


## Installation

[Installation and Setup](http://sensu-plugins.io/docs/installation_instructions.html)

## Notes
