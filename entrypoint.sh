#!/bin/bash

#######################################################################################################
#
# Installs dependencies from the provided Gemfile, and executes nanoc to build your site
#
#######################################################################################################

set -o errexit

SOURCE_DIRECTORY=${GITHUB_WORKSPACE}/$INPUT_SOURCE
DESTINATION_DIRECTORY=${GITHUB_WORKSPACE}/$INPUT_DESTINATION
PROJECT_NANOC_OUTPUT_DIRECTORY=${SOURCE_DIRECTORY}/${INPUT_PROJECT_NANOC_OUTPUT_DIR}

# Set verbose flag
if [ "$INPUT_VERBOSE" = 'true' ]; then
  VERBOSE='--verbose'
else
  VERBOSE=''
fi

cd "$SOURCE_DIRECTORY"
bundle install
bundle exec nanoc compile "$VERBOSE"

mv "$PROJECT_NANOC_OUTPUT_DIRECTORY" "$DESTINATION_DIRECTORY"
