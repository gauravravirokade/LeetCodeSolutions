-- A telecommunications company wants to invest in new countries.
-- The company intends to invest in the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.

-- Write a solution to find the countries where this company can invest.

-- Assumption a call should considered for both the caller and callee's country.

WITH
    person_country_codes
        AS ( -- Get the country code of the person from the phone number
               SELECT
                   id
                 , SUBSTRING(phone_number FROM 1 FOR 3) AS country_code
               FROM person
           )
  , caller_country
        AS  ( -- Get the country of the caller
               SELECT
                   ct.name
                 , pcc.country_code AS country_code
                 , duration
               FROM calls AS c
                    LEFT JOIN person_country_codes AS pcc
                       ON c.caller_id = pcc.id
                    LEFT JOIN country AS ct
                       ON pcc.country_code = ct.country_code
           )
  , callee_country
        AS ( -- Get the country of the callee
               SELECT
                   ct.name
                 , pcc.country_code AS country_code
                 , duration
               FROM calls AS c
                    LEFT JOIN person_country_codes AS pcc
                       ON c.callee_id = pcc.id
                    LEFT JOIN country AS ct
                       ON pcc.country_code = ct.country_code
           )
  , all_calls
        AS ( -- Get all the calls and their duration - caller and callee
               SELECT *
               FROM caller_country
               UNION ALL
               SELECT *
               FROM callee_country
           )
  , country_average
        AS ( -- Get the average duration of the calls in each country
               SELECT
                   name
                 , AVG(duration) AS avg_country_duration
               FROM all_calls
               GROUP BY
                   1
           )
-- Get the countries where the average call duration of the calls in this country is strictly greater than the global average call duration.
SELECT
    name AS country
FROM country_average
WHERE
    avg_country_duration > ( -- Get the global average call duration
                               SELECT
                                   AVG(duration)
                               FROM all_calls
                           )