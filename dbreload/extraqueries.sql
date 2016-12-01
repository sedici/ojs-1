TRUNCATE TABLE `article_search_keyword_list`;
TRUNCATE TABLE `article_search_object_keywords`;
TRUNCATE TABLE `article_search_objects`;
TRUNCATE TABLE `timed_views_log`;
UPDATE `plugin_settings` SET `setting_value` = '0' WHERE `plugin_settings`.`plugin_name` = 'usagestatsplugin' AND `plugin_settings`.`locale` = '' AND `plugin_settings`.`journal_id` = 0 AND `plugin_settings`.`setting_name` = 'enabled';
DELETE FROM `plugin_settings` WHERE `plugin_name` = 'pdfjsviewerplugin';
