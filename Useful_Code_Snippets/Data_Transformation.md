** Box-Cox Transforming the entire numerical dataframe:
  ```from scipy import stats
  import pandas as pd
  # column needs to be all positive numbers
  df_x = pd.DataFrame.from_dict({col:stats.boxcox(df[col])[0] for col in df})
  ```
