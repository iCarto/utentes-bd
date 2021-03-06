-- Deploy utentes:add_tables_cbase_201905 to pg

BEGIN;


CREATE TABLE cbase.aras (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    area NUMERIC(10, 2),
    bacia TEXT,
    rio TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.aras USING GIST (geom);


CREATE TABLE cbase.bacias (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    subacia TEXT,
    area NUMERIC(10, 2),
    ara TEXT,
    rio_prin TEXT,
    long_rio NUMERIC(10, 2),
    afluentes TEXT,
    pre_media NUMERIC(10, 2),
    esc_medio NUMERIC(10, 2),
    cau_medio NUMERIC(10, 2),
    n_estac_h INTEGER,
    n_utentes INTEGER,
    grandes_b TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.bacias USING GIST (geom);


CREATE TABLE cbase.albufeiras (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    tipo_barra TEXT,
    ara TEXT,
    bacia TEXT,
    rio TEXT,
    fonte_loc TEXT,
    fiab_loc TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.albufeiras USING GIST (geom);


CREATE TABLE cbase.lagos (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    area NUMERIC(10, 2),
    ara TEXT,
    bacia TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.lagos USING GIST (geom);


CREATE TABLE cbase.rios (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    longitude NUMERIC(10, 2),
    ara TEXT,
    bacia TEXT,
    subacia TEXT,
    geom GEOMETRY(MULTILINESTRING, 32737)
);
CREATE INDEX ON cbase.rios USING GIST (geom);


CREATE TABLE cbase.entidades_populacao (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    tipo TEXT,
    entidade TEXT,
    ara TEXT,
    bacia TEXT,
    geom GEOMETRY(POINT, 32737)
);
CREATE INDEX ON cbase.entidades_populacao USING GIST (geom);


CREATE TABLE cbase.estradas (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    codigo_id TEXT,
    nome TEXT,
    tipo TEXT,
    longitud NUMERIC(10, 2),
    ara TEXT,
    geom GEOMETRY(MULTILINESTRING, 32737)
);
CREATE INDEX ON cbase.estradas USING GIST (geom);


CREATE TABLE cbase.paises_limitrofes (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.paises_limitrofes USING GIST (geom);


CREATE TABLE cbase.oceanos (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.oceanos USING GIST (geom);


CREATE TABLE cbase.batimetria (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    profundid int4,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.batimetria USING GIST (geom);


CREATE TABLE cbase.provincias (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.provincias USING GIST (geom);


CREATE TABLE cbase.distritos (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    loc_provin TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.distritos USING GIST (geom);


CREATE TABLE cbase.postos (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    loc_distri TEXT,
    loc_provin TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.postos USING GIST (geom);

COMMIT;
