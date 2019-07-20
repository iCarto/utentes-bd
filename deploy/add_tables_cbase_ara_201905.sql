-- Deploy utentes:changes_in_cbase_for_creating_elle_maps to pg

BEGIN;

UPDATE domains.ara SET tooltip = 'ARA Sul' WHERE key = 'Sul';
UPDATE domains.ara SET tooltip = 'ARA Zambeze' WHERE key = 'Zambeze';
UPDATE domains.ara SET tooltip = 'ARA Norte' WHERE key = 'Norte';

CREATE TABLE cbase.bacias_representacion (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase.bacias_representacion USING GIST (geom);

CREATE SCHEMA cbase_ara;

CREATE TABLE cbase_ara.aras (
    gid int PRIMARY KEY REFERENCES cbase.aras(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    area NUMERIC(10, 2),
    bacia TEXT,
    rio TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.aras USING GIST (geom);

INSERT INTO cbase_ara.aras SELECT * FROM cbase.aras WHERE nome ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.bacias (
    gid int PRIMARY KEY REFERENCES cbase.bacias(gid) ON UPDATE CASCADE ON DELETE CASCADE,
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
CREATE INDEX ON cbase_ara.bacias USING GIST (geom);

INSERT INTO cbase_ara.bacias SELECT * FROM cbase.bacias WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);
CREATE TABLE cbase_ara.bacias_representacion (
    gid int PRIMARY KEY REFERENCES cbase.bacias_representacion(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.bacias_representacion USING GIST (geom);
INSERT INTO cbase_ara.bacias_representacion SELECT * FROM cbase.bacias_representacion WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);



CREATE TABLE cbase_ara.albufeiras (
    gid int PRIMARY KEY REFERENCES cbase.albufeiras(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    tipo_barra TEXT,
    ara TEXT,
    bacia TEXT,
    rio TEXT,
    fonte_loc TEXT,
    fiab_loc TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.albufeiras USING GIST (geom);
INSERT INTO cbase_ara.albufeiras SELECT * FROM cbase.albufeiras WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.lagos (
    gid int PRIMARY KEY REFERENCES cbase.lagos(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    area NUMERIC(10, 2),
    ara TEXT,
    bacia TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.lagos USING GIST (geom);
INSERT INTO cbase_ara.lagos SELECT * FROM cbase.lagos WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.rios (
    gid int PRIMARY KEY REFERENCES cbase.rios(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    longitude NUMERIC(10, 2),
    ara TEXT,
    bacia TEXT,
    subacia TEXT,
    geom GEOMETRY(MULTILINESTRING, 32737)
);
CREATE INDEX ON cbase_ara.rios USING GIST (geom);
INSERT INTO cbase_ara.rios SELECT * FROM cbase.rios WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.entidades_populacao (
    gid int PRIMARY KEY REFERENCES cbase.entidades_populacao(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    tipo TEXT,
    entidade TEXT,
    ara TEXT,
    bacia TEXT,
    geom GEOMETRY(POINT, 32737)
);
CREATE INDEX ON cbase_ara.entidades_populacao USING GIST (geom);
INSERT INTO cbase_ara.entidades_populacao SELECT * FROM cbase.entidades_populacao WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.estradas (
    gid int PRIMARY KEY REFERENCES cbase.estradas(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    codigo_id TEXT,
    nome TEXT,
    tipo TEXT,
    longitud NUMERIC(10, 2),
    ara TEXT,
    geom GEOMETRY(MULTILINESTRING, 32737)
);
CREATE INDEX ON cbase_ara.estradas USING GIST (geom);
INSERT INTO cbase_ara.estradas SELECT * FROM cbase.estradas WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.paises_limitrofes (
    gid int PRIMARY KEY REFERENCES cbase.paises_limitrofes(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.paises_limitrofes USING GIST (geom);
INSERT INTO cbase_ara.paises_limitrofes SELECT * FROM cbase.paises_limitrofes WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.oceanos (
    gid int PRIMARY KEY REFERENCES cbase.oceanos(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.oceanos USING GIST (geom);
INSERT INTO cbase_ara.oceanos SELECT * FROM cbase.oceanos WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.batimetria (
    gid int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    profundid int4,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.batimetria USING GIST (geom);
INSERT INTO cbase_ara.batimetria (profundid, ara, geom) SELECT profundid, ara, ST_Multi((ST_Dump(geom)).geom) FROM cbase.batimetria ;

CREATE TABLE cbase_ara.provincias (
    gid int PRIMARY KEY REFERENCES cbase.provincias(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.provincias USING GIST (geom);
INSERT INTO cbase_ara.provincias SELECT * FROM cbase.provincias WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.provincias_outras (
    gid int PRIMARY KEY REFERENCES cbase.provincias(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.provincias_outras USING GIST (geom);
INSERT INTO cbase_ara.provincias_outras SELECT * FROM cbase.provincias WHERE ara not ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);



CREATE TABLE cbase_ara.distritos (
    gid int PRIMARY KEY REFERENCES cbase.distritos(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    loc_provin TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.distritos USING GIST (geom);
INSERT INTO cbase_ara.distritos SELECT * FROM cbase.distritos WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


CREATE TABLE cbase_ara.postos (
    gid int PRIMARY KEY REFERENCES cbase.postos(gid) ON UPDATE CASCADE ON DELETE CASCADE,
    nome TEXT,
    loc_distri TEXT,
    loc_provin TEXT,
    censo_2007 INTEGER,
    ara TEXT,
    geom GEOMETRY(MULTIPOLYGON, 32737)
);
CREATE INDEX ON cbase_ara.postos USING GIST (geom);
INSERT INTO cbase_ara.postos SELECT * FROM cbase.postos WHERE ara ilike (SELECT '%' || tooltip || '%' FROM domains.ara LIMIT 1);


COMMIT;