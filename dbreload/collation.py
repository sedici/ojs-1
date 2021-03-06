from MySQLdb import connect
import os
import sys


conn = connect(host=sys.argv[4], user=sys.argv[1], passwd=sys.argv[2])
cur = conn.cursor()

cur.execute("show databases;")
dbs_to_update = [sys.argv[3]];

for db_to_update in dbs_to_update:
	print "Updating %s db" % db_to_update
	print "-" * (12 + len(db_to_update))
	print db_to_update
	cur.execute("use %s" % db_to_update)
	cur.execute("show tables;")

	tables_to_update = [t[0] for t in cur.fetchall()]

	for table_to_update in tables_to_update:
		query =	"ALTER TABLE %s CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;" % table_to_update
		cur.execute(query)
		print table_to_update, "updated"
