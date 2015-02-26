AutoFS Cookbook
===============
The AutoFS cookbook is a library cookbook that provides resource primitives for
use in recipes.

Scope
-----
This cookbook configures clients that use autofs
See: http://linux.die.net/man/8/automount

This cookbook does not concern itself with managing an NFS server.

Requirements
------------
- Chef 11 or higher
- Ruby 1.9 or higher (preferably from the Chef full-stack installer)
- Network accessible package repositories

 Platform
---------
* Debian, Ubuntu
* CentOS, Red Hat

Usage
=====

```
autofs_nfs 'bowl' do
  mount_point '/bowl'
  server 'tinynfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs3'
end
```

This will create a mount at `/bucket` with the mount options `-fstype=nfs4`
on the server `big-server.home`.
This information will be set in the file
`/etc/auto.nfs`.
An entry in `auto.master` will be created for this file.

Recipes
=======

## default
Include the default recipe to enable the `autofs_nfs` resource


License and Author
==================

* Author: Dan Webb (<d.webb@derby.ac.uk>)
* Author: Luke Bradbury (<luke.bradbury@derby.ac.uk>)


Copyright: 2015, University of Derby

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
