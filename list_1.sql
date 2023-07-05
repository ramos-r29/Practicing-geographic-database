/*
1 – Run a query to list the polygon that has the largest area.

2 –Make a query to list the area by color.

3–Do a query to list the centroid of the polygon.

4–Do a query to list the polygon's neighbors 5.

5–Do a query to list the number of neighbors per polygon.
*/


DROP TABLE IF EXISTS tbmap;

CREATE TABLE IF NOT EXISTS tbmap (
  gid SERIAL NOT NULL,
  color VARCHAR(10) NOT NULL,
  geom geometry(Polygon,4326),
  CONSTRAINT tbmapa_pkey PRIMARY KEY (gid)
);
INSERT INTO tbmap(gid,color,geom)
VALUES
(1,'blue',st_geomfromtext('Polygon((0 0, 3 0, 3 2, 5 2, 5 4, 7 4, 7 6, 2 6, 2 5, 4 5, 4 3, 0 3, 0 0))',4326)),
(2,'yellow',st_geomfromtext('Polygon((1 3, 4 3, 4 4, 1 4, 1 3))',4326)),
(3,'red',st_geomfromtext('Polygon((0 3, 1 3, 1 4, 4 4, 4 5, 2 5, 2 6, 1 6, 1 8, 0 8, 0 3))',4326)),
(4,'yellow',st_geomfromtext('Polygon((0 8, 1 8, 1 6, 4 6, 4 15, 0 15, 0 8))',4326)),
(5,'green',st_geomfromtext('Polygon((4 6, 7 6, 7 7, 10 7, 10 11, 4 11, 4 6))',4326)),
(6,'orange',st_geomfromtext('Polygon((3 0, 18 0, 18 5, 7 5, 7 4, 5 4, 5 2, 3 2, 3 0),(8 2, 11 2, 11 4, 8 4, 8 2),(13 3, 14 3, 14 1, 16 1, 16 4, 13 4, 13 3))',4326)),
(7,'green',st_geomfromtext('Polygon((8 2, 11 2, 11 4, 8 4, 8 2))',4326)),
(8,'blue',st_geomfromtext('Polygon((13 3, 14 3, 14 1, 16 1, 16 4, 13 4, 13 3))',4326)),
(9,'red',st_geomfromtext('Polygon((7 5, 19 5, 19 8, 16 8, 16 10, 10 10, 10 7, 7 7, 7 5),(12 7, 14 7, 14 9, 12 9, 12 7))',4326)),
(10,'green',st_geomfromtext('Polygon((12 7, 14 7, 14 9, 12 9, 12 7))',4326)),
(11,'blue',st_geomfromtext('Polygon((18 0, 28 0, 28 9, 19 9, 19 5, 18 5, 18 0),(21 6, 23 6, 23 8, 21 8, 21 6),(20 1, 25 1, 25 5, 20 5, 20 1),(25 5, 26 5, 26 6, 25 6, 25 5))',4326)),
(12,'green',st_geomfromtext('Polygon((21 6, 23 6, 23 8, 21 8, 21 6))',4326)),
(13,'green',st_geomfromtext('Polygon((20 1, 25 1, 25 5, 20 5, 20 1))',4326)),
(14,'red',st_geomfromtext('Polygon((25 5, 26 5, 26 6, 25 6, 25 5))',4326)),
(15,'yellow',st_geomfromtext('Polygon((15 10, 16 10, 16 8, 19 8, 19 9, 21 9, 21 12, 15 12, 15 10))',4326)),
(16,'red',st_geomfromtext('Polygon((21 9, 28 9, 28 15, 26 15, 26 12, 21 12, 21 9))',4326)),
(17,'orange',st_geomfromtext('Polygon((15 12, 26 12, 26 15, 15 15, 15 12))',4326)),
(18,'blue',st_geomfromtext('Polygon((4 11, 10 11, 10 10, 15 10, 15 15, 4 15, 4 11))',4326));

-- Resolution

-- 1 – Run a query to list the polygon that has the largest area.
SELECT 
  gid
  , color
  , st_area(geom)
FROM
  tbmap 
ORDER BY st_area(geom) DESC
LIMIT 1 ;

-- 2 – Make a query to list the area by color.
SELECT 
  color
  , sum(st_area(geom))
FROM
  tbmap 
GROUP BY color ; 

-- 3–Do a query to list the centroid of the polygon.
SELECT 
  gid
  , color
  , st_astext(st_centroid(geom))
FROM
  tbmap  ;

-- 4 - Do a query to list the polygon's neighbors 5.
SELECT 
  b.gid
  , b.color
FROM
  tbmap AS a
    JOIN tbmap as b
      ON ST_Touches(a.geom, b.geom)
WHERE 
  a.gid = 5 ;

-- 5–Do a query to list the number of neighbors per polygon.
SELECT 
  a.gid
  , count(b.gid)
FROM
  tbmap AS a
    JOIN tbmap as b
      ON ST_Touches(a.geom, b.geom) 
GROUP BY a.gid ;


