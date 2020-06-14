# AutoFS Cookbook CHANGELOG

## 2.3.0

- Transfered cookbook to Sous-Chefs
- Standardised files
- Run latest cookstyle on cookbook
- Added Github Actions for testing
- Added support for Centos-8
- Removed support for Centos-6
- Added Dokken testing
- Min Chef version is now 12.21

## 2.2.2 (2020-02-03)

- In map_entry use find_resource to conditionally create the automaster_entry.

## 2.2.1 (2019-12-30)

- Removed dependency on chef-sugar.

## 2.2.0 (2019-08-22)

- Support for Chef 14.

## 2.1.0 (2018-02-08)

- Support wildcard maps and improve robustness (regex matching)

## 2.0.2 (2017-12-13)

- Updated cookbook versions in metadata and fixed rubocop warnings.

## 2.0.1 (2017-05-24)

- Updated nfs resource to use fstype property.

## 2.0.0 (2016-09-05)

- Refactored to use new resource model with compat_resource (#18).

## 1.0.3 (2015-05-11)

- Bug: #9 duplicate entries for the same mountpoint.

## 1.0.2 (2015-04-24)

- Bug: line matching does not work.

## 1.0.1 (2015-04-20)

- Refactored NFS block to change order at which packages are installed.

## 0.2.2 (2015-03-12)

- Bugs #4 & #5 fixed and small amount of rubocop.

## 0.2.0 (2015-02-27)

- Refactored entire cookbook to a resource model <https://github.com/chef-cookbooks/resource>.
- Cookbook now supports less platforms as there are currently no tests for SmartOS and Solaris2. If you would like support for these platform, please submit a PR respective tests.
