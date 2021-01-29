use bb_cv;
ALTER TABLE cv_template CHANGE `cv_template` `cv_template_id` int primary key auto_increment ;
ALTER TABLE `cv_template` RENAME COLUMN `cv_template` TO `cv_template_id`;
ALTER TABLE cv_template
DROP COLUMN cv_template;
ALTER TABLE `cv_template` CHANGE `cv_template` `cv_template_id` INT primary key not NULL AUTO_INCREMENT ;


SET sql_mode = '';
set global sql_mode = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';