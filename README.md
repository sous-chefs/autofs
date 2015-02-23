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
* CentOS, Red Hat, Fedora, Scientific, Amazon, XenServer
* SmartOS, Solaris2


Attributes 
============

#TODO: this section needs fully filling out
For now please consult attributes/default.rb for attirbutes you can set. 

Usage
=====

```
autofs '/bucket' do 
  mount_point '/bucket' 
  server 'bignfs-server.home'
  export '/example/remote_path/'
  mount_options '-fstype=nfs4'
end
```

This will create a mount at /bucket with the mount options -fstype=nfs4 
on the server big-server.home. This information will be set in the file
/etc/auto.bucket. A entry in auto.master will be created for this file.

Recipes
=======

## default
Include the default recipe in a run list, to install & configure autofs.

Data Structure
==============
  node
    autofs
      mounts 
        nfs
          mount point 1
            name
            server
            mount_options
            export
          mount point 2
            name 
            server
            mount_options
            export
        smb
          mount point 1
            name
            server
            mount_options
            export
      master
         thing1
         thing2
         thing3



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
