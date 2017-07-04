#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
### Added
- added ruby 2.4 testing (@majormoses)

### Fixed
- PR template spelling (@majormoses)

## [3.0.0]
### Breaking Change
- bin/check-load.rb remove option for per_core as its useless and broken (@majormoses)
- bin/metrics-load.rb remove option for per_core as its useless and broken (@majormoses)

### Changed
- moved common logic into its own library location (@majormoses)
### Fixed
- bin/metrics-load.rb now uses common logic which fixes issues with uptime LOCALE parsing (@majormoses)

### [2.0.0]
### Breaking Change
- bin/check-load.rb change the default of per_core to true (@majormoses)
### Changed
- Use the `uptime` command in bin/check-load.rb as well (@smuth4)
- Correctly detect the number of cores on BSD (@smuth4)
- bin/check-load.rb better output message (@woltage)
- bin/check-load.rb change the default thresholds to better align with per_core values (@majormoses)
- bin/check-load.rb changes to use >= rather than > for thresholds (@majormoses)
- bin/check-load.rb switch to using 'unknown' rather than 'warning' when unable to determine the load average (@majormoses)

## [1.0.0] - 2016-06-16
### Changed
- Loosen dependency on sensu-plugin from `= 1.2.0` to `~> 1.2`
- Update Rubocop to 0.40, apply auto-correct.

### Removed
- Removed Ruby 1.9.3 support; add Ruby 2.3.0 support to test matrix.

## [0.0.4] - 2015-12-11
### Changed
- Use pure ruby for cpu count in check-load.rb

## [0.0.3] - 2015-07-14
### Changed
- updated sensu-plugin gem to 1.2.0

## [0.0.2] - 2015-06-03
### Fixed
- added binstubs

### Changed
- removed cruft from /lib

## 0.0.1 - 2015-05-21
### Added
- initial release

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/3.0.0...HEAD
[3.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/2.0.0...3.0.0
[2.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.1...0.0.2
