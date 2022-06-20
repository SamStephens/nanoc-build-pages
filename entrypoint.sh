#!/bin/bash

#######################################################################################################
#
# Installs dependencies from the provided Gemfile, and executes nanoc to build your site
#
#######################################################################################################

set -o errexit

SOURCE_DIRECTORY=${GITHUB_WORKSPACE}/$INPUT_SOURCE

# Set verbose flag
if [ "$INPUT_VERBOSE" = 'true' ]; then
  VERBOSE='--verbose'
else
  VERBOSE=''
fi

cd "$SOURCE_DIRECTORY"
bundle install
bundle exec nanoc compile "$VERBOSE"
