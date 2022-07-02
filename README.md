# GardenControl-Server
Brains of the GardenControl System with options to manage, monitor, control and schedule multiple GardenControl-Nodes.

This is a very early **ALPHA development version**. Use with caution, I am not responsible for anything it may do to your system! (Actually it can't do much yet... 😅)

## How to install?

1. Install the docker runtime and docker-compose. For Windows, install Docker with WSL2 backend! See here: [Docker with WSL2 installation](https://docs.docker.com/desktop/windows/wsl/)
2. Run `git clone https://github.com/mva-one/GardenControl-Server.git`
3. `cd` into the freshly created directory `GardenControl-Server`
4. Copy `.env.example` to `.env` and make changes if desired
5. `docker-compose up -d --force-recreate` 🥳

## The .env

This files is used to configure some very basic environment variables which are used inside the containers.

| Environment variable | Meaning                                                                                                                |
|----------------------|------------------------------------------------------------------------------------------------------------------------|
| `POSTGRES_DB`        | The name of the database which will be generated on first startup                                                      |
| `POSTGRES_PASSWORD`  | The password of the `postgres` superuser in the database                                                               |
| `PGRST_DB_URI`       | The connection URI for PostgREST. Contains username, password and address and name of the database (server).           |
| `PGRST_DB_SCHEMAS`   | Name of the database schema used by PostgREST.                                                                         |
| `PGRST_DB_ANON_ROLE` | Name of the database user used by PostgREST when processing requests. Using `postgres` here is a severe security risk! |

## How to use?

There are 4 different services (containers), as defined in the `docker-compose.yaml`: 
1. database: `postgres` on port `5432`
2. REST API for the database: `postgrest` on port `3000`
3. the Node.JS application itself: `gctl-server` on port `3001`
4. AdMiner to be able to "see inside" the database: `adminer` on port `8080`

To stop everything, run `docker-compose down -v` from the same console you started it.

### Example

Only the latter two are relevant. Navigate your Browser to http://localhost:3001/actors for example to see the gctl-actors defined in the database. If you do so, the following things happen under the hood:
1. NodeJS receives the request and processes it in `routes/actor.js`
2. A GET request is being sent to PostgREST
3. PostgREST contacts the PostgreSQL database and runs the SQL query, returning a JSON array with the gctl-actors
4. the view `views/actors.pug` is being rendered with the objects in the JSON array
5. the rendered view (now containing the gctl-actors) is sent back to your browser

### AdMiner

To see directly what's in the database, you can use "AdMiner" - a handy little tool for visualizing a database, running in its own container in our case. Navigate your browser to http://localhost:8080 and enter the credentials: 
- "PostgreSQL" as the Database system,
- `db` as database server (this is the name of the potgresql container, as defined in the `docker-compose.yaml`)
- `postgres` as user (since there aren't any others yet)
- the value of `POSTGRES_PASSWORD` from the `.env` is the password
- and the value of `POSTGRES_DB` is the database name

Now you're in and have all the privileges inside the Database. Switch the schema to `gctl` in the upper left corner and you'll see the tables. 

It is important to mention though, that **Docker volumes won't be persisted yet**. That means, when recreating the Stack, all data from the database will be restored to the default dummy data.