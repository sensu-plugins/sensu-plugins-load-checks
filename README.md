[![Sensu Bonsai Asset](https://img.shields.io/badge/Bonsai-Download%20Me-brightgreen.svg?colorB=89C967&logo=sensu)](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-load-checks)
[ ![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-load-checks.svg)](http://badge.fury.io/rb/sensu-plugins-load-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks)

## Sensu Plugins Load Checks Plugin

- [Overview](#overview)
- [Files](#files)
- [Usage examples](#usage-examples)
- [Configuration](#configuration)
  - [Sensu Go](#sensu-go)
    - [Asset registration](#asset-registration)
    - [Asset definition](#asset-definition)
    - [Check definition](#check-definition)
  - [Sensu Core](#sensu-core)
    - [Check definition](#check-definition)
- [Installation from source](#installation-from-source)
- [Additional notes](#additional-notes)
- [Contributing](#contributing)

### Overview

This plugin provides native load instrumentation for monitoring and metrics collection, including load health and total or per-core metrics.

### Files
 * bin/check-load.rb
 * bin/metrics-load.rb
 
**check-load**
Takes the `loadavg` and divides by the number of cores.

**metrics-load**
Uses uptime to collect load metrics. The number of CPUs is determined by reading `/proc/cpuinfo`, which makes the feature Linux-specific.

## Usage examples

### Help

**check-load.rb**
```
Usage: check-load.rb (options)
    -c, --crit L1,L5,L15             Load CRITICAL threshold, 1/5/15 min average
    -w, --warn L1,L5,L15             Load WARNING threshold, 1/5/15 min average  
```

**metrics-load.rb**
```
Usage: metrics-load.rb (options)
        --scheme SCHEME              Metric naming scheme, text to prepend to .$parent.$child
```

## Configuration
### Sensu Go
#### Asset registration

Assets are the best way to make use of this plugin. If you're not using an asset, please consider doing so! If you're using sensuctl 5.13 or later, you can use the following command to add the asset: 

`sensuctl asset add sensu-plugins/sensu-plugins-load-checks`

If you're using an earlier version of sensuctl, you can download the asset definition from [this project's Bonsai asset index page](https://bonsai.sensu.io/assets/sensu-plugins/sensu-plugins-load-checks).

#### Asset definition

```yaml
---
type: Asset
api_version: core/v2
metadata:
  name: sensu-plugins-load-checks
spec:
  url: https://assets.bonsai.sensu.io/1accacdd780175a02183e722effa0986e6472f21/sensu-plugins-load-checks_5.0.0_centos_linux_amd64.tar.gz
  sha512: 0e97bc162d6f9529ef044d0173f97330c597d31cf3389539baed6d17c713a8961e8d7e0f62b2f195eae6da66dc65ddfbff59379f0c846596b29fb6977b4e368b
```

#### Check definition

```yaml
---
type: CheckConfig
spec:
  command: "check-load.rb"
  handlers: []
  high_flap_threshold: 0
  interval: 10
  low_flap_threshold: 0
  publish: true
  runtime_assets:
  - sensu-plugins/sensu-plugins-load-checks
  - sensu/sensu-ruby-runtime
  subscriptions:
  - linux
```

### Sensu Core

#### Check definition
```json
{
  "checks": {
    "check-load": {
      "command": "check-load.rb",
      "subscribers": ["linux"],
      "interval": 10,
      "refresh": 10,
      "handlers": ["influxdb"]
    }
  }
}
```

## Installation from source

### Sensu Go

See the instructions above for [asset registration](#asset-registration).

### Sensu Core

Install and setup plugins on [Sensu Core](https://docs.sensu.io/sensu-core/latest/installation/installing-plugins/).

## Additional notes

### Sensu Go Ruby Runtime Assets

The Sensu assets packaged from this repository are built against the Sensu Ruby runtime environment. When using these assets as part of a Sensu Go resource (check, mutator, or handler), make sure to include the corresponding [Sensu Ruby Runtime Asset](https://bonsai.sensu.io/assets/sensu/sensu-ruby-runtime) in the list of assets needed by the resource.

## Contributing

See [CONTRIBUTING.md](https://github.com/sensu-plugins/sensu-plugins-load-checks/blob/master/CONTRIBUTING.md) for information about contributing to this plugin.
