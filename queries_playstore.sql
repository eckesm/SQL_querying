-- Comments in SQL Start with dash-dash --

-- 1
SELECT * FROM analytics WHERE id = 1880;

-- 2
SELECT id,app_name FROM analytics WHERE last_updated = '2018-08-01';

-- 3 
SELECT category,COUNT(*) FROM analytics GROUP BY category;

-- 4
SELECT app_name,reviews FROM analytics ORDER BY reviews DESC LIMIT 5;

-- 5
SELECT app_name,reviews FROM analytics WHERE rating >= 4.8 ORDER BY reviews DESC LIMIT 1;

-- 6
SELECT category,AVG(rating) AS avg_rating FROM analytics GROUP BY category ORDER BY avg_rating DESC;

-- 7
SELECT app_name,price,rating FROM analytics WHERE rating < 3 ORDER BY price DESC LIMIT 1;

-- 8
SELECT * FROM analytics WHERE min_installs <= 50 AND rating != 0 ORDER BY rating DESC;

-- 9
SELECT app_name FROM analytics WHERE rating < 3 AND reviews >= 10000;

-- 10
SELECT app_name FROM analytics WHERE price BETWEEN 0.1 AND 1 ORDER BY reviews DESC LIMIT 10;

-- 11
SELECT * FROM analytics WHERE reviews = (SELECT MAX(reviews) FROM analytics WHERE category = 'DATING');

-- 12
SELECT * FROM analytics WHERE price = (SELECT MAX(price) FROM analytics);

-- 13
SELECT SUM(reviews) AS all_reviews FROM analytics;

--14 
SELECT category,COUNT(*) AS number_apps FROM analytics GROUP BY category HAVING COUNT(*) > 300 ORDER BY COUNT(*) DESC;

-- 15
SELECT app_name,reviews,min_installs,min_installs/reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;

-- FS1 (required solution)
SELECT app_name,rating,category FROM analytics
Where(rating,category) IN (SELECT MAX(rating), category FROM analytics WHERE min_installs >= 50000 GROUP BY category) ORDER BY category;

-- FS2
WHERE app_name ILIKE '%facebook%';

-- FS3
SELECT app_name,genres FROM analytics
WHERE array_length(genres,1)>1;

-- FS4
SELECT * FROM analytics
WHERE genres @> '{Education}';
