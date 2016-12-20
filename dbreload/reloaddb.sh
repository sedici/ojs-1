DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PHP=/usr/bin/php5;
usuario="root";
clave="root";
dbname="ojs30";

cd $DIR
echo "Borrando la base"
mysqladmin -f drop ojs30 -uroot -proot
echo "Creando la base"
mysqladmin create ojs30 -uroot -proot
echo "Cargando la base"
mysql -u$usuario -p$clave $dbname < ./db.sql
echo "Ejecutando extraqueries.sql"
mysql -u$usuario -p$clave $dbname < ./extraqueries.sql
echo "Ejecutando collation.py"
python ./collation.py
echo "empieza la migracion!"
$PHP ../tools/upgrade.php upgrade
echo "Ejecutando postqueries.sql"
mysql -u$usuario -p$clave $dbname < ./postqueries.sql
echo "Ejecutando pdf.py"
python ./pdf.py
echo "Fin de la migración"
