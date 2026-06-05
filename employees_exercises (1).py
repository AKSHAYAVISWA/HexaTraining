# Exercise 1
with open("employees.txt") as f:
    content = f.read()
print(content)

# Exercise 2
with open("employees.txt") as f:
    for line in f:
        print(line.strip())

# Exercise 3
with open("employees.txt") as f:
    lines = f.readlines()
print(f"Total Employees = {len(lines)}")

# Exercise 4
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        print(fields[1])

# Exercise 5
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        if fields[4] == "Hyderabad":
            print(line.strip())

# Exercise 6
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        if fields[4] == "Bangalore":
            print(line.strip())

# Exercise 7
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        if int(fields[3]) > 80000:
            print(line.strip())

# Exercise 8
salaries = []
with open("employees.txt") as f:
    for line in f:
        salaries.append(int(line.strip().split(",")[3]))
print(f"Highest Salary = {max(salaries)}")

# Exercise 9
salaries = []
with open("employees.txt") as f:
    for line in f:
        salaries.append(int(line.strip().split(",")[3]))
print(f"Lowest Salary = {min(salaries)}")

# Exercise 10
salaries = []
with open("employees.txt") as f:
    for line in f:
        salaries.append(int(line.strip().split(",")[3]))
print(f"Average Salary = {sum(salaries) / len(salaries)}")

# Exercise 11
total = 0
with open("employees.txt") as f:
    for line in f:
        total += int(line.strip().split(",")[3])
print(f"Total Salary Payout = {total}")

# Exercise 12
count = 0
with open("employees.txt") as f:
    for line in f:
        if line.strip().split(",")[2] == "AI Engineering":
            count += 1
print(f"AI Engineering = {count}")

# Exercise 13
count = 0
with open("employees.txt") as f:
    for line in f:
        if line.strip().split(",")[2] == "Data Engineering":
            count += 1
print(f"Data Engineering = {count}")

# Exercise 14
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        if fields[2] == "AI Engineering":
            print(line.strip())

# Exercise 15
with open("employees.txt") as fin, open("high_salary_employees.txt", "w") as fout:
    for line in fin:
        if int(line.strip().split(",")[3]) > 80000:
            fout.write(line)

# Exercise 16
with open("employees.txt") as fin, open("hyderabad_employees.txt", "w") as fout:
    for line in fin:
        if line.strip().split(",")[4] == "Hyderabad":
            fout.write(line)

# Exercise 17
cities = set()
with open("employees.txt") as f:
    for line in f:
        cities.add(line.strip().split(",")[4])
print(f"Unique Cities = {len(cities)}")
for city in sorted(cities):
    print(city)

# Exercise 18
dept_count = {}
with open("employees.txt") as f:
    for line in f:
        dept = line.strip().split(",")[2]
        dept_count[dept] = dept_count.get(dept, 0) + 1
for dept, count in dept_count.items():
    print(f"{dept} = {count}")

# Exercise 19
top_name, top_sal = "", 0
with open("employees.txt") as f:
    for line in f:
        fields = line.strip().split(",")
        if int(fields[3]) > top_sal:
            top_sal = int(fields[3])
            top_name = fields[1]
print(top_name)
print(top_sal)

# Exercise 20
salaries = []
with open("employees.txt") as f:
    for line in f:
        salaries.append(int(line.strip().split(",")[3]))
with open("employee_report.txt", "w") as fout:
    fout.write(f"Total Employees = {len(salaries)}\n")
    fout.write(f"Highest Salary  = {max(salaries)}\n")
    fout.write(f"Lowest Salary   = {min(salaries)}\n")
    fout.write(f"Average Salary  = {sum(salaries) / len(salaries):.2f}\n")
    fout.write(f"Total Salary    = {sum(salaries)}\n")
