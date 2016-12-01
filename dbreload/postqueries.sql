#Cambiar sqlmode

SET GLOBAL sql_mode='ALLOW_INVALID_DATES';

SELECT @@GLOBAL.sql_mode;

#Habilitar plugin de bloques

UPDATE `plugin_settings` SET `setting_value` =1 WHERE `plugin_name` = "customBlockManagerPlugin" AND `setting_name` = "enabled";

#Habilitar bloques de cada revista

UPDATE `plugin_settings` SET `setting_value`= 1 WHERE `setting_name` = 'context' AND `setting_value` = 2 AND `plugin_name` NOT LIKE '%plugin%';

#Habilitar tapas de las revistas

UPDATE `issue_settings` SET `locale`='', `setting_name`='coverImage' WHERE `setting_name`='fileName' AND `locale`='es_ES';


