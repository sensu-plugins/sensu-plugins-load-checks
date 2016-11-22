#Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed at [Keep A Changelog](http://keepachangelog.com/)

## [Unreleased]
### Changed
- Use the `uptime` command in bin/check-load.rb as well
- Correctly detect the number of cores on BSD
- bin/check-load.rb change the default of per_core to true
- bin/check-load.rb change the default thresholds to better align with per_core values
- bin/check-load.rb changes to use >= rather than > for thresholds
- bin/check-load.rb switch to using 'unknown' rather than 'warning' when unable to determine the load average

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

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/1.0.0...HEAD
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.1...0.0.2
