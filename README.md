## Sensu-Plugins-load-checks

[![Build Status](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks.svg?branch=master)](https://travis-ci.org/sensu-plugins/sensu-plugins-load-checks)
[![Gem Version](https://badge.fury.io/rb/sensu-plugins-load-checks.svg)](http://badge.fury.io/rb/sensu-plugins-load-checks)
[![Code Climate](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/gpa.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Test Coverage](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks/badges/coverage.svg)](https://codeclimate.com/github/sensu-plugins/sensu-plugins-load-checks)
[![Dependency Status](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks.svg)](https://gemnasium.com/sensu-plugins/sensu-plugins-load-checks)
[ ![Codeship Status for sensu-plugins/sensu-plugins-load-checks](https://codeship.com/projects/5de2a3e0-db96-0132-e4a4-0eed4ec53b27/status?branch=master)](https://codeship.com/projects/79666)

## Functionality

## Files
 * bin/check-load
 * bin/metircs-load

## Usage

## Installation

Add the public key (if you haven’t already) as a trusted certificate

```
gem cert --add <(curl -Ls https://raw.githubusercontent.com/sensu-plugins/sensu-plugins.github.io/master/certs/sensu-plugins.pem)
gem install sensu-plugins-load-checks -P MediumSecurity
```

You can also download the key from /certs/ within each repository.

#### Rubygems

`gem install sensu-plugins-load-checks`

#### Bundler

Add *sensu-plugins-disk-checks* to your Gemfile and run `bundle install` or `bundle update`

#### Chef

Using the Sensu **sensu_gem** LWRP
```
sensu_gem 'sensu-plugins-load-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

Using the Chef **gem_package** resource
```
gem_package 'sensu-plugins-load-checks' do
  options('--prerelease')
  version '0.0.1'
end
```

## Notes
