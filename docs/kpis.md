# KPIs demostrativos

## Objetivo

Definir indicadores básicos para la supervisión operativa de instalaciones técnicas.

| KPI | Definición |
|---|---|
| Valor medio por sensor | Promedio de mediciones por punto de control |
| Valor mínimo | Menor valor observado |
| Valor máximo | Mayor valor observado |
| Mediciones fuera de rango | Número de registros que incumplen umbrales definidos |
| Incidencias abiertas | Incidencias sin cierre |
| Tiempo medio de resolución | Tiempo promedio entre apertura y cierre |
| Mantenimientos vencidos | Tareas cuya fecha prevista ha sido superada |
| Consumo energético | Consumo acumulado por periodo |

## Ejemplos

### Temperatura media

```text
AVG(temperatura)
```

### Incidencias abiertas

```text
COUNT(incidencias WHERE estado = 'abierta')
```

### Cumplimiento preventivo

```text
mantenimientos realizados / mantenimientos planificados
```

Los valores del repositorio son demostrativos y se calculan únicamente sobre datos sintéticos.
