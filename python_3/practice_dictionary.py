# print("jelo")
sample_dictionary = {
    'name' : 'Gaurav',
    'age' : 29,
    'company' : 'Talkiatry',
    'salary' : 50.34
}
# to reterive a value from a dictionary
# 1
employee_name =  sample_dictionary['name']
print("1. " + employee_name)
emp_name = sample_dictionary.get('name')
print("2. " + emp_name)

# employee_city = sample_dictionary['city']
# print (employee_city)


# .get() is useful when we dont have a the requested key in our dictionary, the default value is 'None' but we can default it to anything we want
# in the below example I am defaulting the city to 'Tampa'.

employee_city = sample_dictionary.get('city','Tampa')
# print(employee_city)

# add a new field to an existing dictionary
sample_dictionary['city'] = 'Tampa'

print(sample_dictionary)

