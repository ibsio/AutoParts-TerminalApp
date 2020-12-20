#!/bin/zsh

gem install bundler
bundle install
clear
echo $1
ruby index.rb $1
