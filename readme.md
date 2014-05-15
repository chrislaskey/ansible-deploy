About
================================================================================

An ansible playbook for deploying websites. Built to be flexible, allowing each
website deploy to be as simple or complex as needed.

The included example shows a robust example of deploying by restoring user data
from a backup server, deploying the latest repository code on the web server,
and setting up the database on the database server.

The playbook assumes the 
[chrislaskey/ansible-configure](https://github.com/chrislaskey/ansible-configure)
playbook has been used to configure the web, database, and backup servers.

Tested on CentOS 6.5. Works with SELinux enabled.


License
================================================================================

All code written by me is released under MIT license. See the attached
license.txt file for more information, including commentary on license choice.
