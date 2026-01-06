-- List tables
SELECT name
FROM sqlite_master
WHERE type='table'
ORDER BY name;

-- Total crime rows
SELECT COUNT(*) AS crime_rows
FROM CRIME;

-- Crimes containing MINOR
SELECT CASE_NUMBER, DESCRIPTION
FROM CRIME
WHERE DESCRIPTION LIKE '%MINOR%'
LIMIT 25;

-- Community with highest incident count
SELECT c.COMMUNITY_AREA_NAME AS community_name,
       COUNT(*) AS incident_count
FROM CRIME cr
JOIN CENSUS c ON cr.COMMUNITY_AREA_NUMBER = c.COMMUNITY_AREA_NUMBER
WHERE cr.COMMUNITY_AREA_NUMBER IS NOT NULL
GROUP BY c.COMMUNITY_AREA_NAME
ORDER BY incident_count DESC
LIMIT 1;

-- Top 5 community areas by incident count
SELECT COMMUNITY_AREA_NUMBER AS community_area_number,
       COUNT(*) AS incident_count
FROM CRIME
WHERE COMMUNITY_AREA_NUMBER IS NOT NULL
GROUP BY COMMUNITY_AREA_NUMBER
ORDER BY incident_count DESC
LIMIT 5;

-- Average safety score for middle schools
SELECT AVG(CAST(SAFETY_SCORE AS REAL)) AS avg_safety_score_ms
FROM SCHOOLS
WHERE "Elementary, Middle, or High School" = 'MS'
  AND SAFETY_SCORE IS NOT NULL
  AND TRIM(SAFETY_SCORE) GLOB '[0-9]*';
