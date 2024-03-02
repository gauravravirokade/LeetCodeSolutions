-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places.

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016 -- sum of all total investment values in 2016
FROM insurance
WHERE
      tiv_2015 IN ( -- have the same tiv_2015 value as one or more other policyholders
                      SELECT
                          tiv_2015
                      FROM insurance
                      GROUP BY
                          1
                      HAVING
                          COUNT(*) > 1
                  )
  AND ( -- are not located in the same city as any other policyholder
          (lat, lon) IN
          (
              SELECT
                  lat
                , lon
              FROM insurance
              GROUP BY
                  1
                , 2
              HAVING
                  COUNT(*) = 1
          )
    )