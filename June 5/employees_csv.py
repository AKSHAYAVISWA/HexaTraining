import csv

with open("employees.csv") as f:
    reader = csv.DictReader(f)
    employees = list(reader)

# Exercise 4
top = max(employees, key=lambda e: int(e["salary"]))
print(f"Highest Salary = {top['salary']} ({top['name']})")

# Exercise 5
low = min(employees, key=lambda e: int(e["salary"]))
print(f"Lowest Salary = {low['salary']} ({low['name']})")

# Exercise 6
avg = sum(int(e["salary"]) for e in employees) / len(employees)
print(f"Average Salary = {avg}")

# Exercise 7
total = sum(int(e["salary"]) for e in employees)
print(f"Total Salary Payout = {total}")

# Exercise 8
for e in employees:
    if e["city"] == "Hyderabad":
        print(e)

# Exercise 9
for e in employees:
    if e["department"] == "AI Engineering":
        print(e)

# Exercise 10
for e in employees:
    if int(e["salary"]) > 80000:
        print(e)
