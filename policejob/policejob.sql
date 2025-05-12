INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('police', 'Police', 1);

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('police', 0, 'recrue', 'Recrue', 300, '{}', '{}'),
('police', 1, 'officier', 'Officier', 500, '{}', '{}'),
('police', 2, 'sergent', 'Sergent', 700, '{}', '{}'),
('police', 3, 'lieutenant', 'Lieutenant', 900, '{}', '{}'),
('police', 4, 'chef', 'Chef', 1200, '{}', '{}');