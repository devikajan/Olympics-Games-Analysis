SELECT
    ID,
    Name AS [Competitor Name],
    CASE 
        WHEN SEX = 'M' THEN 'Male' 
        ELSE 'Female' 
    END AS [Sex],
    Age,
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 30 THEN '26-30'
        ELSE 'Over 30'
    END AS [Age Grouping],
    Height,
    Weight,
    NOC AS [Nation Code],
    LEFT(Games, CHARINDEX(' ', Games) - 1) AS [Year],
    Sport,
    Event,
    CASE 
        WHEN Medal = 'NA' THEN 'Not Registered' 
        ELSE Medal 
    END AS [Medal]
FROM 
    [olympic_games].[dbo].[athletes_event_results]
WHERE 
    RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) - 1) = 'Summer';
