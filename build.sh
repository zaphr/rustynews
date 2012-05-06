#!/bin/bash

## TODO: check that rvm and ruby 1.9.2+ is installed

gem install bundler -v '1.0.22'
bundle _1.0.22_ install
bundle _1.0.22_ exec rake db:migrate
bundle _1.0.22_ exec rake db:seed
