DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PHP=/usr/bin/php5.6;
cd $DIR
echo "borramos la base vieja"
mysqladmin -f drop ojs30 -uroot -proot
echo "va volvemos a crear"
mysqladmin create ojs30 -uroot -proot
echo "le encajamos la base 2.4"
mysql -uroot -proot ojs30 < ./db.sql
echo "le metemos consultas para que todo ande a al hora de migrar"
mysql -uroot -proot ojs30 < ./extraqueries.sql
echo "pasamos las tablas a utf8"
python ./collation.py
echo "empieza la migracion!"
$PHP ../tools/upgrade.php upgrade
echo "Vamow a ejecutar las queries faltantes"
mysql -uroot -proot ojs30 < ./postqueries.sql
echo "ahora vamos con un par de cositas mas de python"
python ./pdf.py
echo "terminamos, gapish"
