USE db_zoo

/* ZOO DATABASE ASSIGNMENT 1: */

SELECT * FROM tbl_habitat;

/* ZOO DATABASE ASSIGNMENT 2: */

SELECT species_name
FROM tbl_species
WHERE species_order = 3
;

/* ZOO DATABASE ASSIGNMENT 3: */

SELECT nutrition_type
FROM tbl_nutrition
WHERE nutrition_cost <= 600.00
;

/* ZOO DATABASE ASSIGNMENT 4: */

SELECT species_name
FROM tbl_species
INNER JOIN tbl_nutrition
ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
WHERE species_nutrition BETWEEN 2202 AND 2206
;

/* ZOO DATABASE ASSIGNMENT 5: */

SELECT species_name AS 'Species Name:', nutrition_type AS 'Nutrition Type:'
FROM tbl_species
INNER JOIN tbl_nutrition
ON tbl_species.species_nutrition = tbl_nutrition.nutrition_id
;

/* ZOO DATABASE ASSIGNMENT 6: */

SELECT specialist_fname AS 'First Name', specialist_lname AS 'Last Name', specialist_contact AS 'Phone Number'
FROM tbl_specialist
INNER JOIN tbl_care ON tbl_specialist.specialist_id = tbl_care.care_specialist
INNER JOIN tbl_species ON tbl_care.care_id = tbl_species.species_care
WHERE species_name = 'Penguin'
;
