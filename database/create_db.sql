CREATE SCHEMA  gctl;
-- DROP TABLE IF EXISTS gctl.sensor;
-- DROP TABLE IF EXISTS gctl.actor;
-- DROP TABLE IF EXISTS gctl.node;

CREATE TABLE gctl.node (
    nid     SERIAL PRIMARY KEY,
    host    VARCHAR(100) NOT NULL,
    descr   VARCHAR(100)
);

CREATE TABLE gctl.actor (
    aid     SERIAL PRIMARY KEY,
    node    INTEGER REFERENCES gctl.node(nid),
    atype   CHAR NOT NULL,
    gpio    NUMERIC(2),
    stat    BOOLEAN NOT NULL DEFAULT FALSE,
    inv     BOOLEAN NOT NULL DEFAULT FALSE,
    lock    BOOLEAN NOT NULL DEFAULT FALSE,
    enab    BOOLEAN NOT NULL DEFAULT TRUE,
    descr   VARCHAR(100),
    CONSTRAINT actor_type CHECK (atype IN ('V', 'P', 'L'))
);

CREATE TABLE gctl.sensor (
    sid         SERIAL PRIMARY KEY,
    node        INTEGER REFERENCES gctl.node(nid),
    stype       CHAR NOT NULL,
    val         REAL,
    gpio        NUMERIC(2),
    refr        INTEGER NOT NULL DEFAULT 60,
    enab        BOOLEAN NOT NULL DEFAULT TRUE,
    descr       VARCHAR(100),
    CONSTRAINT sensor_type CHECK (stype IN ('F', 'R', 'H', 'L')),
    CONSTRAINT refresh_int_positive CHECK (refr > 0)
);

INSERT INTO gctl.node(host, descr) VALUES
('node1:4242', 'Node South-East'),
('node-north:4242', 'Node North'),
('sense-node:4242', 'Sensors');

INSERT INTO gctl.actor(node, atype, descr) VALUES
(1, 'V', 'Water Section South'),
(1, 'V', 'Water Section East'),
(1, 'P', 'Pump South-East'),
(2, 'V', 'Water North'),
(2, 'L', 'Garden Lights');

INSERT INTO gctl.sensor (node, stype, descr) VALUES
(1, 'F', 'Water flow South-East'),
(3, 'R', 'Local Rain Status'),
(3, 'L', 'How bright it is'),
(3, 'H', 'Average Air Humidity');