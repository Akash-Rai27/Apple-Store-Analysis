USE Apple_store;

-- checking the number of unique apps

SELECT COUNT(DISTINCT [track_name]) from [dbo].[AppleStore$];

SELECT COUNT(DISTINCT [track_name]) from [dbo].[appleStore_description$];

-- CHECKING NULL VALUES

SELECT COUNT(*) from [dbo].[AppleStore$] WHERE [track_name] IS NULL OR [size_bytes] IS NULL OR  [prime_genre] IS NULL;

SELECT COUNT(*) from [dbo].[appleStore_description$] WHERE [track_name] IS NULL OR [size_bytes] IS NULL OR [app_desc] IS NULL;

-- NUMBER OF APPS PER GENRE

SELECT [prime_genre], COUNT(*) AS Number_of_apps FROM [dbo].[AppleStore$] GROUP BY prime_genre ORDER BY Number_of_apps;

-- DESCRIPTION OF APPS RATINGS

SELECT MIN([user_rating]) AS MINIMUM_RATING, MAX([user_rating]) AS MAXIMUM__RATING,  ROUND(AVG([user_rating]),2) AS AVERAGE_RATING FROM AppleStore$;

-- Ratings of paid apps vs free apps
SELECT [track_name], [price],CASE WHEN [price]>0 THEN 'PAID' ELSE 'FREE' END AS price_bucket  FROM [dbo].[AppleStore$];

SELECT CASE WHEN [price]<>0 THEN 'PAID' ELSE 'FREE' END AS [price_bucket], ROUND(AVG([user_rating]),2) AS Averge_rating 
FROM [dbo].[AppleStore$] GROUP BY CASE WHEN [price]<>0 THEN 'PAID' ELSE 'FREE' END;

-- ratings as per language support

SELECT CASE WHEN [lang_num]<10 THEN 'Less than 10 languages' WHEN [lang_num] BETWEEN 10 AND 30 THEN 'Between 10 to 20 languages' ELSE 'More than 30 languages' END AS
language_bucket, ROUND(AVG([user_rating]),2) AS AvgRating FROM [dbo].[AppleStore$] GROUP BY CASE WHEN [lang_num]<10 THEN 'Less than 10 languages' 
WHEN [lang_num] BETWEEN 10 AND 30 THEN 'Between 10 to 20 languages' ELSE 'More than 30 languages' END;

-- Genrres with low rating

SELECT  [prime_genre], ROUND(AVG([user_rating]),2) AS AvgRating FROM [dbo].[AppleStore$] GROUP BY [prime_genre] ORDER BY AvgRating ASC LIMIT 10 ;

