# Write a solution to find all the authors that viewed at least one of their own articles.
#
# Return the result table sorted by id in ascending order.

import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    # Filter rows where author_id is equal to viewer_id
    filtered_views = views[views["author_id"] == views["viewer_id"]]
    # Get unique author_id values from the filtered DataFrame
    unique_author = filtered_views["author_id"].unique()
    # Convert unique_author to a DataFrame and sort the values in ascending order
    return pd.DataFrame({'id': unique_author}).sort_values(by='id')
