"""Ejemplo de analítica sobre datos sintéticos.

Proyecto: Mikel Trueba Control
Finalidad: portafolio técnico.
"""

from pathlib import Path

import pandas as pd


DATA_PATH = Path(__file__).resolve().parents[1] / "data" / "datos_sinteticos.csv"


def cargar_datos(path: Path = DATA_PATH) -> pd.DataFrame:
    """Carga el dataset sintético y convierte la fecha a datetime."""
    df = pd.read_csv(path)
    df["timestamp"] = pd.to_datetime(df["timestamp"], errors="raise")
    return df


def validar_datos(df: pd.DataFrame) -> None:
    """Valida las columnas mínimas esperadas."""
    columnas_requeridas = {
        "timestamp",
        "sensor_id",
        "instalacion",
        "variable",
        "valor",
        "unidad",
        "estado",
    }
    faltantes = columnas_requeridas.difference(df.columns)

    if faltantes:
        raise ValueError(f"Faltan columnas requeridas: {sorted(faltantes)}")


def calcular_kpis(df: pd.DataFrame) -> pd.DataFrame:
    """Calcula estadísticos básicos por sensor y variable."""
    return (
        df.groupby(["sensor_id", "variable"], as_index=False)
        .agg(
            mediciones=("valor", "count"),
            valor_medio=("valor", "mean"),
            minimo=("valor", "min"),
            maximo=("valor", "max"),
        )
        .sort_values(["sensor_id", "variable"])
    )


def main() -> None:
    """Ejecuta el flujo demostrativo."""
    df = cargar_datos()
    validar_datos(df)
    kpis = calcular_kpis(df)

    print("Datos sintéticos cargados:", len(df))
    print(kpis.to_string(index=False))


if __name__ == "__main__":
    main()
