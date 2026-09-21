-- Mikel Trueba Control
-- Esquema demostrativo para portafolio.
-- No contiene datos operativos reales.

CREATE TABLE instalaciones (
    instalacion_id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    tipo VARCHAR(80),
    ubicacion VARCHAR(160)
);

CREATE TABLE equipos (
    equipo_id BIGSERIAL PRIMARY KEY,
    instalacion_id BIGINT NOT NULL REFERENCES instalaciones(instalacion_id),
    nombre VARCHAR(120) NOT NULL,
    categoria VARCHAR(80),
    estado VARCHAR(30) NOT NULL DEFAULT 'operativo'
);

CREATE TABLE sensores (
    sensor_id BIGSERIAL PRIMARY KEY,
    equipo_id BIGINT REFERENCES equipos(equipo_id),
    codigo VARCHAR(40) NOT NULL UNIQUE,
    variable VARCHAR(80) NOT NULL,
    unidad VARCHAR(30)
);

CREATE TABLE mediciones (
    medicion_id BIGSERIAL PRIMARY KEY,
    sensor_id BIGINT NOT NULL REFERENCES sensores(sensor_id),
    fecha_hora TIMESTAMP NOT NULL,
    valor NUMERIC NOT NULL,
    estado VARCHAR(30)
);

CREATE TABLE incidencias (
    incidencia_id BIGSERIAL PRIMARY KEY,
    equipo_id BIGINT REFERENCES equipos(equipo_id),
    fecha_apertura TIMESTAMP NOT NULL,
    fecha_cierre TIMESTAMP,
    descripcion TEXT NOT NULL,
    prioridad VARCHAR(20),
    estado VARCHAR(30) NOT NULL DEFAULT 'abierta'
);

CREATE TABLE mantenimiento (
    mantenimiento_id BIGSERIAL PRIMARY KEY,
    equipo_id BIGINT NOT NULL REFERENCES equipos(equipo_id),
    tipo VARCHAR(30) NOT NULL,
    fecha_prevista DATE,
    fecha_realizada DATE,
    descripcion TEXT,
    estado VARCHAR(30)
);

CREATE INDEX idx_mediciones_sensor_fecha
    ON mediciones (sensor_id, fecha_hora);

CREATE INDEX idx_incidencias_estado
    ON incidencias (estado);
