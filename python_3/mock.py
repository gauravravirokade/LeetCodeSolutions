from datetime import date

x="hello gaurav hello"
print(str(x),str(x)[::-1])

employees = [
    {
        "name": "Gaurav R",
        "title": "DE",
        "hire_date": date(2022, 2, 22)
    },
    {
        "name": "Jonathan D",
        "title": "DE",
        "hire_date": date(2023, 8, 15)
    },
    {
        "name": "Rhiannon T",
        "title": "BI",
        "hire_date": date(2023, 1, 1)
    },
    {
        "name": "David S",
        "title": "SWE",
        "hire_date": date(2021, 1, 1)
    }
]
default_date=None
for employee in employees:
    if default_date is None:
        default_date = employee["hire_date"]
    elif default_date > employee["hire_date"]:
        default_date = employee["hire_date"]


print(default_date)

 #get the count of employees based on their title and store it in the dictionary
employee_team ={}

for employee in employees:
    if employee["title"] in employee_team:
        employee_team[employee["title"]] += 1
    else:
        employee_team[employee["title"]] = 1




print(employee_team)





github = [
    {
        "author": "Gaurav R",
        "stats": {
            "commits": 54,
            "merges": 12
        }
    },
    {
        "author": "Jonathan D",
        "stats": {
            "commits": 23,
            "merges": 8
        }
    },
    {
        "author": "Rhiannon T",
        "stats": {
            "commits": 5,
            "merges": 2
        }
    },
    {
        "author": "David S",
        "stats": {
            "commits": 27,
            "merges": 13
        }
    }
]