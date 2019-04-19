# Change Log
This project adheres to [Semantic Versioning](http://semver.org/).

This CHANGELOG follows the format listed [here](https://github.com/sensu-plugins/community/blob/master/HOW_WE_CHANGELOG.md)

## [Unreleased]

## [5.0.0] - 2019-04-18
### Breaking Changes
- Update minimum required ruby version to 2.3. Drop unsupported ruby versions.
- Bump `sensu-plugin` dependency from `~> 1.2` to `~> 4.0` you can read the changelog entries for [4.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#400---2018-02-17), [3.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#300---2018-12-04), and [2.0](https://github.com/sensu-plugins/sensu-plugin/blob/master/CHANGELOG.md#v200---2017-03-29)

### Added
- Travis build automation to generate Sensu Asset tarballs that can be used n conjunction with Sensu provided ruby runtime assets and the Bonsai Asset Index
- Require latest sensu-plugin for [Sensu Go support](https://github.com/sensu-plugins/sensu-plugin#sensu-go-enablement)


## [4.0.2] - 2018-03-27
### Security
- updated yard dependency to `~> 0.9.11` per: https://nvd.nist.gov/vuln/detail/CVE-2017-17042 (@majormoses)

## [4.0.1] - 2018-03-07
### Security
- updated rubocop dependency to `~> 0.51.0` per: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-8418. (@majormoses)

### Changed
- appeased the cops (@majormoses)

### Fixed
- Remove the comment explaining the per-cores flag from the merics-load.rb file as this option no longer exists (@AaronKalair)

### Fixed
- use the `quick` tests as we want to not run all integration tests just the requested suites (@majormoses)

## [4.0.0] - 2017-10-03
### Breaking Changes
- dropped support for Ruby 2.0.0 (@barryorourke)

### Added
- now includes kitchen integration tests (@barryorourke)
- added ruby 2.4 testing (@majormoses)

### Changed
- updated the changelog location guidelines (@majormoses)

### Fixed
- PR template spelling (@majormoses)
- make changelog a title (@majormoses)

## [3.0.0] - 05-18-2017
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

[Unreleased]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/5.0.0...HEAD
[5.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/4.0.2...5.0.0
[4.0.2]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/4.0.1...4.0.2
[4.0.1]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/4.0.0...4.0.1
[4.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/3.0.0...4.0.0
[3.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/2.0.0...3.0.0
[2.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/1.0.0...2.0.0
[1.0.0]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.4...1.0.0
[0.0.4]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.3...0.0.4
[0.0.3]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.2...0.0.3
[0.0.2]: https://github.com/sensu-plugins/sensu-plugins-load-checks/compare/0.0.1...0.0.2
