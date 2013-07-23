Description
===========

Cookbook to install and configure autofs.
Prerequisite packages are also installed.

Requirements
============

Chef 0.10.10+ and Ohai 6.10+ for `platform_family` use.

## Platform

* Debian, Ubuntu
* CentOS, Red Hat, Fedora, Scientific, Amazon, XenServer
* SmartOS, Solaris2

Attributes 
============

See `attributes/default.rb` for default values.

Usage
=====
Simply include the `autofs` recipe where ever you would like autofs installed.

Example role configuration:

    name "autofs"
    description "Configure nfs partitions"
    default_attributes(
      "autofs" => {
        "maps" => {
          "nfs" => {
            "keys" => {
              "/nfs" => {
                "export" => "/exports/nfs",
                "server" => "nfs.example.com",
                "options" => "-fstype=nfs"
              }
            },
            "source" => "/etc/auto.nfs"
          }
        }
      }
    )
    run_list(
      "recipe[autofs]"
    )

Recipes
=======

## default

Include the default recipe in a run list, to install & configure autofs.

## linux

Called by default recipe for linux platforms. May be included in a run list directly.

## smartos

Called by default recipe for smartos & solaris. May be included in a run list directly.

## common

Configuration common to all platforms

License and Author
==================

* Author: Seth Kingry (<s.kingry@modcloth.com>)
* Author: Luke Bradbury (<luke.bradbury@derby.ac.uk>)

Copyright: 2012, ModCloth, Inc.
Copyright: 2013, University of Derby

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
