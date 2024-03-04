-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes.
-- Type I Diabetes always starts with DIAB1 prefix.

select * from patients
where trim(conditions) like 'DIAB1%';