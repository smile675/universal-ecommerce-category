Universal Ecommerce Category List

## Introduction

This project aims to provide an easy-to-use and flexible universal category list for ecommerce applications. The category list is designed to accommodate a hierarchy of up to five levels, with unique identifiers for each category.

## Aim of the Project

The goal of this project is to create a category list that allows for easy management and organization of products in ecommerce applications. The category list uses a numbering system to ensure unique identifiers for each category, allowing for easy insertion of new categories between existing ones.

## Strategy

Primary category IDs start from 100 and are three digits long.
Each subsequent level adds an additional two digits to the ID, starting from 10.
For example, a level 1 category might have an ID of 100, while a level 2 category under it might have an ID of 10010.
This approach allows for a maximum of 999 entries at the primary level and 99 entries at each subsequent level, ensuring a unique identifier for each category.

## Example Category Hierarchy

| Category          | ID          | Parent ID | Level |
| ----------------- | ----------- | --------- | ----- |
| Women Clothes     | 100         | NULL      | 1     |
| Tops              | 10010       | 100       | 2     |
| Tanks & Camisoles | 1001010     | 10010     | 3     |
| ...               | ...         | ...       | ...   |
| Maximum Level 5   | 99999999999 | ...       | 5     |

This table represents the hierarchy of categories in your project, with the "Level" column indicating the depth in the hierarchy.

## How to Create Table in MySQL Using this Category List using csv file

step1: Install MySQL and create a schema:

step2: Select the schema and create a table with the following structure:

```sql

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

```

step3: Use the table data import wizard to import categories from a CSV file. In the CSV file, represent null values as 0. After importing, replace all 0 values with null using the following SQL queries:

```sql
CREATE TEMPORARY TABLE temp_ids
SELECT id
FROM categories
WHERE parent_id = 0;

UPDATE categories
SET parent_id = NULL
WHERE id IN (SELECT id FROM temp_ids);

DROP TEMPORARY TABLE IF EXISTS temp_ids;

UPDATE categories
SET description = NULL,
    image = NULL,
    meta_data = NULL,
    slug = NULL;
```

## How to Create Table in MySQL Using this Category List using json file

you can use any programming language to make a create call to your mysql table.
in json file null value is represented as null, so there is no issue like csv file.

Feel free to contribute to this project in order to improve further the cateogry tables
Thanks in advance if you can improve the category tree further.
