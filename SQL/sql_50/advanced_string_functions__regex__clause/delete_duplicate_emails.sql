-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

delete p1 from person p1,person p2
where p1.email=p2.email and p1.id>p2.id;