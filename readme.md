# Fhem chef Cookbook

A chef cookbook to setup the [Fhem](http://fhem.de/) home automation system.  After this cookbook is run, the server will be running a web server on [localhost:8083](http://localhost:8083) and a telnet server on localhost:7073.

## Requirements

This cookbook has been tested on Ubuntu 12.04.

This cookcook depends on apt being up to date.  It also depends on the cpan cookbook being installed.

## Attributes

- `node['fhem']['version']` - Version of Fhem to install from the fhem website.  Defaults to 5.4.

## Usage

This cookbook includes only 1 recipe- `fhem::default`.  You'll want to include that recipe in your runlist.

## Authors

- [Nick Rowe](http://dcxn.com)
