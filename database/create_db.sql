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
    descr   VARCHAR(100),
    CONSTRAINT actor_type CHECK (atype IN ('V', 'P', 'L'))
);
