#!/usr/bin/env bash

# MySQL Deploy | Import database data if needed
#
# Normally this would be split into two ansible commands, the first registering
# an ansible variable with the result. The second checking the variable with a
# when statement. This is cleaner and preferred whenever possible.
#
# In this case the number of mysql databases is dynamic. This adds iteration to
# the equation. The code below does both steps at once, trading readability for
# simplicity, namely less state to keep track of inside ansible.

db=$1
restore_file="/tmp/mysql-restores/${db}.sql" 

if [[ `mysqlshow -u root $db | wc -l` -gt 5 ]]; then
	# The `mysqlshow` command outputs a list of tables. When a database is empty the
	# command output is 5 lines long, which is checked for using `wc`.

	echo "Database ${db} already exists and contains data, skipping import"
	exit 0
fi

if [[ ! -f "$restore_file" ]]; then
	echo "ERROR: ${db} database is empty but no restore file could be found"
	echo "       Searched: ${restore_file}"
	exit 10
fi

if ! mysql -u root $db < $restore_file; then
	echo "ERROR: failed to import ${db} database data from restore file '${restore_file}'"
	exit 11
fi

echo "Successfully imported ${db} database data"
