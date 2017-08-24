#!/bin/bash
#
# Install load checks plugin for testing
#

set -e

source /etc/profile
DATA_DIR=/tmp/kitchen/data
RUBY_HOME=${MY_RUBY_HOME}

# Set the locale
apt-get install -y locales build-essential
locale-gen en_US.UTF-8
export LANG="en_US.UTF-8"
export LANGUAGE="en_US:en"
export LC_ALL="en_US.UTF-8"

cd $DATA_DIR
SIGN_GEM=false gem build sensu-plugins-load-checks.gemspec
gem install sensu-plugins-load-checks-*.gem

