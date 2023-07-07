DROP TABLE IF EXISTS tbpoligono;
DROP TABLE IF EXISTS tblinha;
DROP TABLE IF EXISTS tbponto;
DROP TABLE IF EXISTS tbmultiponto;

CREATE TABLE IF NOT EXISTS tbpoligono (
  gid SERIAL NOT NULL,
  classe VARCHAR(10) NOT NULL,
  geom geometry(Polygon,4326),
  CONSTRAINT tbpoligono_pkey PRIMARY KEY (gid)
);

CREATE TABLE IF NOT EXISTS tblinha (
  gid SERIAL NOT NULL,
  classe VARCHAR(10) NOT NULL,
  geom geometry(LineString,4326),
  CONSTRAINT tblinha_pkey PRIMARY KEY (gid)
);

CREATE TABLE IF NOT EXISTS tbponto (
  gid SERIAL NOT NULL,
  classe VARCHAR(10) NOT NULL,
  geom geometry(Point,4326),
  CONSTRAINT tbponto_pkey PRIMARY KEY (gid)
);

CREATE TABLE IF NOT EXISTS tbmultiponto (
  gid SERIAL NOT NULL,
  classe VARCHAR(10) NOT NULL,
  geom geometry(MultiPoint,4326),
  CONSTRAINT tbmultiponto_pkey PRIMARY KEY (gid)
);


INSERT INTO tbpoligono(gid,classe,geom)
VALUES
(1,'a',st_geomfromtext('Polygon((0 0, 0.3 0, 0.3 0.2, 0.5 0.2, 0.5 0.4, 0.7 0.4, 0.7 0.6, 0.2 0.6, 0.2 0.5, 0.4 0.5, 0.4 0.3, 0 0.3, 0 0))',4326)),
(2,'b',st_geomfromtext('Polygon((0.1 0.3, 0.4 0.3, 0.4 0.4, 0.1 0.4, 0.1 0.3))',4326)),
(3,'c',st_geomfromtext('Polygon((0 0.3, 0.1 0.3, 0.1 0.4, 0.4 0.4, 0.4 0.5, 0.2 0.5, 0.2 0.6, 0.1 0.6, 0.1 0.8, 0 0.8, 0 0.3))',4326)),
(4,'b',st_geomfromtext('Polygon((0 0.8, 0.1 0.8, 0.1 0.6, 0.4 0.6, 0.4 1.1, 0 1.1, 0 0.8))',4326)),
(5,'d',st_geomfromtext('Polygon((0.4 0.6, 0.7 0.6, 0.7 0.7, 1.0 0.7, 1.0 1.1, 0.4 1.1, 0.4 0.6))',4326)),
(6,'d',st_geomfromtext('Polygon((0.3 0, 1.8 0, 1.8 0.5, 0.7 0.5, 0.7 0.4, 0.5 0.4, 0.5 0.2, 0.3 0.2, 0.3 0),(0.8 0.2, 1.1 0.2, 1.1 0.4, 0.8 0.4, 0.8 0.2),(1.3 0.3, 1.4 0.3, 1.4 0.1, 1.6 0.1, 1.6 0.4, 1.3 0.4, 1.3 0.3))',4326)),
(7,'c',st_geomfromtext('Polygon((0.7 0.5, 1.9 0.5, 1.9 0.8, 1.6 0.8, 1.6 1.0, 1 1.0, 1.0 0.7, 0.7 0.7, 0.7 0.5),(1.2 0.7, 1.4 0.7, 1.4 0.9, 1.2 0.9, 1.2 0.7))',4326)),
(8,'a',st_geomfromtext('Polygon((1.8 0, 2.8 0, 2.8 0.9, 1.9 0.9, 1.9 0.5, 1.8 0.5, 1.8 0),(2.1 0.6, 2.3 0.6, 2.3 0.8, 2.1 0.8, 2.1 0.6),(2.0 0.1, 2.5 0.1, 2.5 0.5, 2.0 0.5, 2.0 0.1),(2.5 0.5, 2.6 0.5, 2.6 0.6, 2.5 0.6, 2.5 0.5))',4326));

INSERT INTO tblinha(gid,classe,geom)
VALUES
(1,'a',st_geomfromtext('LineString(0.1 0.1, 0.3 0.8, 0.8 0.5, 1.7 0.9)',4326)),
(2,'b',st_geomfromtext('LineString(2.1 0.05, 2.3 0.3, 2.7 0.1)',4326)),
(3,'c',st_geomfromtext('LineString(1.2 0.5, 2.5 0.9)',4326)),
(4,'a',st_geomfromtext('LineString(0.9 0.1, 0.7 0.5, 1.9 0.4)',4326)),
(5,'b',st_geomfromtext('LineString(0.1 1, 1.5 1.1)',4326)),
(6,'c',st_geomfromtext('LineString(1 0.3, 1.5 0.05, 1.3 0.3)',4326));

INSERT INTO tbponto(gid,classe,geom)
VALUES
(1,'a',st_geomfromtext('Point(0.3 0.5)',4326)),
(2,'b',st_geomfromtext('Point(0.1 1.2)',4326)),
(3,'c',st_geomfromtext('Point(1.5 0.2)',4326)),
(4,'a',st_geomfromtext('Point(0.4 0.3)',4326)),
(5,'b',st_geomfromtext('Point(1.4 0.9)',4326)),
(6,'c',st_geomfromtext('Point(2.1 1)',4326)),
(7,'a',st_geomfromtext('Point(1.2 0.6)',4326)),
(8,'b',st_geomfromtext('Point(1.8 0.1)',4326)),
(9,'c',st_geomfromtext('Point(1.5 0.5)',4326));

INSERT INTO tbmultiponto(gid,classe,geom)
VALUES
(1,'a',st_geomfromtext('MultiPoint((0.5 0.07),(1 0.03),(1.75 0.5))',4326)),
(2,'b',st_geomfromtext('MultiPoint((0.67 0.9),(0.15 0.86),(0.08 0.46),(0.9 0.75))',4326)),
(3,'c',st_geomfromtext('MultiPoint((1.9 0.03),(2.1 0.25))',4326));


/*
1 – Make a query to obtain a buffer of radius 0.2 at each point of the tbpoint layer, then load the result as a new QGIS layer
*/
SELECT 
  gid
  , classe
  , ST_Buffer(geom, 0.2) AS geom
FROM 
  tbponto



