FROM postgres:10.1

RUN apt-get update && \
    apt-get install git build-essential postgresql-server-dev-9.6 libssl-dev libkrb5-dev -y && \
    rm -rf /var/lib/apt/lists/*

RUN git clone git://git.postgresql.org/git/pldebugger.git && \
    cd pldebugger && \
    USE_PGXS=1 make && \
    USE_PGXS=1 make install

# COPY scripts/enable_debug.sh /docker-entrypoint-initdb.d/enable_debug.sh

COPY sql/01_provision.sql /docker-entrypoint-initdb.d/01_provision.sql
COPY sql/02_profile_function.sql /docker-entrypoint-initdb.d/02_profile_function.sql
COPY sql/90_data.sql /docker-entrypoint-initdb.d/90_data.sql
