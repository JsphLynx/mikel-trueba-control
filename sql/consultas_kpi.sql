-- Consultas demostrativas de KPIs.

-- 1. Estadísticos por sensor
SELECT
    sensor_id,
    COUNT(*) AS numero_mediciones,
    AVG(valor) AS valor_medio,
    MIN(valor) AS valor_minimo,
    MAX(valor) AS valor_maximo
FROM mediciones
GROUP BY sensor_id
ORDER BY sensor_id;

-- 2. Incidencias abiertas
SELECT
    COUNT(*) AS incidencias_abiertas
FROM incidencias
WHERE estado = 'abierta';

-- 3. Tiempo medio de resolución en horas
SELECT
    AVG(EXTRACT(EPOCH FROM (fecha_cierre - fecha_apertura)) / 3600.0)
        AS horas_medias_resolucion
FROM incidencias
WHERE fecha_cierre IS NOT NULL;

-- 4. Mantenimientos vencidos
SELECT
    COUNT(*) AS mantenimientos_vencidos
FROM mantenimiento
WHERE fecha_prevista < CURRENT_DATE
  AND fecha_realizada IS NULL;
