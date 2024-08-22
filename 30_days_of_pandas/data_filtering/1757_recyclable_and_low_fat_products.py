
# Write a solution to find the ids of products that are both low fat and recyclable.
#
# Return the result table in any order.
#
# The result format is in the following example.

import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    low_fat_and_recyclable_filter = ( (products["low_fats"] == 'Y') & (products["recyclable"] == 'Y' ))
    low_fat_and_recyclable_products = products["product_id"].where(low_fat_and_recyclable_filter)
    return low_fat_and_recyclable_products.dropna().to_frame()
