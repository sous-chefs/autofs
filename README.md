# AutoFS Cookbook
===============

[![Cookbook Version](https://img.shields.io/cookbook/v/autofs.svg?style=flat)](https://supermarket.chef.io/cookbooks/autofs)
[![CI State](https://github.com/sous-chefs/autofs/workflows/ci/badge.svg)](https://github.com/sous-chefs/autofs/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

## Description

The AutoFS cookbook is a resource cookbook.

This cookbook configures clients that use autofs
See: http://linux.die.net/man/8/automount

This cookbook does not concern itself with managing an NFS server.

## Requirements

- Chef 15 or higher

## Platforms

See `metadata.rb`

## Usage

### Resources

Add entries directly to auto.master

```ruby
automaster_entry '/smb' do
  map '/etc/auto.smb'
  options '--timeout 600'
end
```

Add entries to custom autofs map file

```ruby
map_entry 'homes' do
  location '://smb-server:directory'
  fstype 'smb'
  options 'rw'
  map '/etc/auto.smb'
end
```

Nfs resource with default entries for map & auto.master

```ruby
nfs '/mnt/nfs' do
  server 'nfsserver'
  export '/example/remote_path/'
  options 'sync'
end
```

## Original Authors

- Author: Dan Webb (<dan.webb@damacus.io>)
- Author: Luke Bradbury (<luke@nqyr.io>)
- Author: Richard Lock (<r.j.lock@derby.ac.uk>)
- Author: James E. Flemer (<james.flemer@ndpgroup.com>)

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
