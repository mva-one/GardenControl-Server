CREATE TABLE IF NOT EXISTS gctl_node (
    nid     SERIAL PRIMARY KEY,
    host    VARCHAR(100) NOT NULL,
    descr   VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS gctl_actor (
    aid     SERIAL PRIMARY KEY,
    node    INTEGER REFERENCES gctl_node(nid),
    atype   CHAR NOT NULL,
    gpio    NUMERIC(2),
    astate  BOOLEAN NOT NULL DEFAULT FALSE,
    invert  BOOLEAN NOT NULL DEFAULT FALSE,
    locked  BOOLEAN NOT NULL DEFAULT FALSE,
    aenable BOOLEAN NOT NULL DEFAULT TRUE,
    descr   VARCHAR(100),
    CONSTRAINT actor_type CHECK (atype IN ('V', 'P', 'L'))
);

CREATE TABLE IF NOT EXISTS gctl_sensor (
    sid         SERIAL PRIMARY KEY,
    node        INTEGER REFERENCES gctl_node(nid),
    stype       CHAR NOT NULL,
    svalue      REAL,
    gpio        NUMERIC(2),
    refresh_int INTEGER NOT NULL DEFAULT 60,
    senable     BOOLEAN NOT NULL DEFAULT TRUE,
    descr       VARCHAR(100),
    CONSTRAINT sensor_type CHECK (stype IN ('F', 'R', 'H', 'L')),
    CONSTRAINT refresh_int_positive CHECK (refresh_int > 0)
);
