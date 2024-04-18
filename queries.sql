-- create a table in your database named categories
CREATE TABLE categories(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
parent_id INT NULL,
level INT NOT NULL,
description TEXT NULL,
image TEXT NULL,
meta_data TEXT NULL,
slug TEXT NULL
);


-- since csv file does not support null, null is represented as 0 in the file.
-- 0 is chosen because, parent_id takes only intiger value

-- after inserting the table using <data table import wizard> we need to change all 0 to null

-- updating parent_id required primary key, so we saved all primary key of level one category into a temp_ids table
CREATE TEMPORARY TABLE temp_ids
SELECT id
FROM categories
WHERE parent_id = 0;

--  then update parent_id in main table to null using the id from temp_ids
UPDATE categories
SET parent_id = NULL
WHERE id IN (SELECT id FROM temp_ids);

-- after that we can drop the temp_ids table
DROP TEMPORARY TABLE IF EXISTS temp_ids;


-- in order to update all description image meta_data and slug to null, we wont need the id
-- so we can directly execute update query.
UPDATE categories
SET description = NULL,
    image = NULL,
    meta_data = NULL,
    slug = NULL;