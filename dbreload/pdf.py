from MySQLdb import connect

conn = connect(user="root", passwd= "root")
cur = conn.cursor()

cur.execute("show databases;")
dbs_to_update = ["ojs30"]

for db_to_update in dbs_to_update:
	print "Updating %s db" % db_to_update
	print "-" * (12 + len(db_to_update))

	cur.execute("use %s" % db_to_update)
	cur.execute("SELECT journal_id from journals;")

	journals_id = [t[0] for t in cur.fetchall()]

	for journal_id in journals_id:
		query =	"INSERT INTO plugin_settings(plugin_name, context_id, setting_name,setting_value, setting_type) VALUES ('pdfjsviewerplugin', %s, 'enabled', '1', 'bool')" %(journal_id)
		print(query)
		cur.execute(query)
		print journal_id, "added"
