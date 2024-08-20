# A country is big if:
#
# it has an area of at least three million (i.e., 3000000 km2), or
# it has a population of at least twenty-five million (i.e., 25000000).
# Write a solution to find the name, population, and area of the big countries.
#
# Return the result table in any order.

import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    column_list = ["name","population","area"]
    filters = (world["area"] >= 3000000) | (world["population"] >= 25000000)
    filtered_world = world[column_list].where(filters)
    return filtered_world.dropna()