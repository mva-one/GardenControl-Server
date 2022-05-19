DROP TABLE IF EXISTS gctl_sensor;
DROP TABLE IF EXISTS gctl_actor;
DROP TABLE IF EXISTS gctl_node;

CREATE TABLE gctl_node (
    nid     SERIAL PRIMARY KEY,
    host    VARCHAR(100) NOT NULL,
    descr   VARCHAR(100)
);

CREATE TABLE gctl_actor (
    aid     SERIAL PRIMARY KEY,
    node    INTEGER REFERENCES gctl_node(nid),
    atype   CHAR NOT NULL,
    gpio    NUMERIC(2),
    stat    BOOLEAN NOT NULL DEFAULT FALSE,
    inv     BOOLEAN NOT NULL DEFAULT FALSE,
    lock    BOOLEAN NOT NULL DEFAULT FALSE,
    enab    BOOLEAN NOT NULL DEFAULT TRUE,
    descr   VARCHAR(100),
    CONSTRAINT actor_type CHECK (atype IN ('V', 'P', 'L'))
);

CREATE TABLE gctl_sensor (
    sid         SERIAL PRIMARY KEY,
    node        INTEGER REFERENCES gctl_node(nid),
    stype       CHAR NOT NULL,
    val         REAL,
    gpio        NUMERIC(2),
    refr        INTEGER NOT NULL DEFAULT 60,
    enab        BOOLEAN NOT NULL DEFAULT TRUE,
    descr       VARCHAR(100),
    CONSTRAINT sensor_type CHECK (stype IN ('F', 'R', 'H', 'L')),
    CONSTRAINT refresh_int_positive CHECK (refr > 0)
);
