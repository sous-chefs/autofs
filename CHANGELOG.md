AutoFS Cookbook CHANGELOG
========================
v1.0.4 (tbc)
Bug #12 no constraints set in metadata
 

v1.0.3 (2015-05-11)
Bug: #9 duplicate entries for the same mountpoint.

v1.0.2 (2015-04-24)
Bug: line matching does not work.

v1.0.1 (2015-04-20)
Refactored NFS block to change order at which packages are installed.

v0.2.2 (2015-03-12)
Bugs #4 & #5 fixed and small amount of rubocop. 

v0.2.0 (2015-02-27)
Refactored entire cookbook to a resource model.

This now uses the resource cookbook which is currently under active development.
https://github.com/chef-cookbooks/resource

Cookbook now supports less platforms as there are currently no tests for SmartOS and Solaris2. If you would like support for these platform, please submit a PR respective tests.
