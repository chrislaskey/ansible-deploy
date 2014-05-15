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


Usage
=====

An example deploy looks like:

	./deploy-project.sh example web.example.com db.example.com

Where `web.example.com` and `db.example.com` are specified in the standard ansible
`hosts` file. The second argument is optional, and if omitted the deploy script
assumes the database server is the same as the web server.

Each project requires its own `project-<name>.yml` file. In the example's case the
deploy script loads `project-example.yml`.

The project definition file is meant to be modular, and some projects may
only require a single block to transfer files.

The included example file is purposefully more robust, and features blocks for
retrieving user data from the backup server, deploying the latest repository
files, and setting up the database.

Notice additional project specific variables can be dynamically loaded using the
`project_vars` variable. This allows project specific information to remain
under version control within the project repository if needed.

Use only what is needed for your particular projects!


License
================================================================================

All code written by me is released under MIT license. See the attached
license.txt file for more information, including commentary on license choice.
