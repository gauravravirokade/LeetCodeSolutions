-- Write a solution to report the first name, last name, city, and state of each person in the Person table.
-- If the address of a personId is not present in the Address table, report null instead.

SELECT
    firstname
  , lastname
  , city
  , state
FROM person AS p
     LEFT JOIN address AS a
        ON p.personid = a.personid