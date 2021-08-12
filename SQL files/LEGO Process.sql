use lego;

# data clean and cluster. 
SELECT 
	*
FROM 
	sets 
INNER JOIN lego_sets ON sets.set_id = lego_sets.set_id;

SELECT * FROM sets;
	
    
# Calculate the average price for each age range. 
SELECT
	ages,AVG(list_price)
FROM
	lego_sets
GROUP BY 
	ages
ORDER BY
	ages DESC;
    
# Calculate the number of each difficulty and their average price. 
SELECT
	COUNT(t.theme_name) AS number, review_difficulty AS difficulty, AVG(list_price)
FROM 
	themes t,
    sets s,
    lego_sets ls
WHERE
	t.theme_id=s.theme_id AND
	s.set_id=ls.set_id
GROUP BY
	review_difficulty;

# Find the avg quatity of parts in different difficulty. 
SELECT
	AVG(num_parts), review_difficulty AS difficulty
FROM
	sets s,
    lego_sets ls
WHERE
	s.set_id=ls.set_id
GROUP BY
	review_difficulty;
    
# Find the sale price in different countries. 
SELECT
	DISTINCT(country),SUM(list_price),AVG(list_price)
FROM
	lego_sets
GROUP BY
	country;

# Find the first 3 countries where lego becomes popular. 
SELECT
	COUNT(set_id),country
FROM
	lego_sets
GROUP BY 
	country 
ORDER BY
	COUNT(set_id) DESC LIMIT 3;


# Find the top 3 popular themes in the world.     
SELECT
	theme_name, COUNT(theme_name)
FROM
	lego_sets
GROUP BY
	theme_name
ORDER BY
	COUNT(theme_name) DESC LIMIT 3;
    

# Find the most popular colors in each country by each year
SELECT 
	country, year, color_id, count(*) as sales
FROM 
	lego_sets 
    INNER JOIN sets ON lego_sets.set_id = sets.set_id
	INNER JOIN inventory ON inventory.set_num = sets.set_id
    INNER JOIN inventory_parts ON inventory.inventory_id = inventory_parts.inventory_id
GROUP BY country, year, color_id
ORDER BY sales DESC;


SELECT
	pc.category_name, sets.name
FROM
	part_category pc
    INNER JOIN parts ON pc.category_id=parts.part_cat_id
    INNER JOIN inventory_parts ON parts.part_num=inventory_parts.part_id
    INNER JOIN  inventory_sets ON inventory_sets.inventory_id=inventory_parts.inventory_id
    INNER JOIN sets ON inventory_sets.set_id=sets.set_id;
    




    

    
    

	