import pandas as pd
import numpy as np

def swap_salary(salary: pd.DataFrame) -> pd.DataFrame:

    # using numpy.where()
    # salary['sex'] = np.where(salary['sex'] == 'f','m','f')

    # using pandas.replace()
    salary['sex'] = salary['sex'].replace({'m':'f','f':'m'})


    return salary
