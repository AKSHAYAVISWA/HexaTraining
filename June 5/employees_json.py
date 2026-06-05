import json

employees = [
    {
        "employee_id": 101,
        "name": "Rahul Sharma",
        "department": "Data Engineering",
        "salary": 75000,
        "city": "Hyderabad"
    },
    {
        "employee_id": 102,
        "name": "Priya Reddy",
        "department": "AI Engineering",
        "salary": 85000,
        "city": "Bangalore"
    },
    {
        "employee_id": 103,
        "name": "Amit Kumar",
        "department": "Data Engineering",
        "salary": 65000,
        "city": "Mumbai"
    },
    {
        "employee_id": 104,
        "name": "Sneha Patel",
        "department": "Data Science",
        "salary": 95000,
        "city": "Chennai"
    },
    {
        "employee_id": 105,
        "name": "Farhan Ali",
        "department": "Cloud Engineering",
        "salary": 80000,
        "city": "Delhi"
    }
]


def find_highest_salary():
    top = max(employees, key=lambda e: e["salary"])
    print("Employee With Highest Salary:")
    print(json.dumps(top, indent=2))


def find_average_salary():
    avg = sum(e["salary"] for e in employees) / len(employees)
    print(f"\nAverage Salary = {avg}")


def display_data_engineering():
    data_eng = [e for e in employees if e["department"] == "Data Engineering"]
    print("\nData Engineering Employees:")
    print(json.dumps(data_eng, indent=2))


def display_high_earners():
    high_earners = [e for e in employees if e["salary"] > 80000]
    print("\nEmployees Earning More Than 80000:")
    print(json.dumps(high_earners, indent=2))


def update_salary(employee_id, new_salary):
    for e in employees:
        if e["employee_id"] == employee_id:
            e["salary"] = new_salary
            print(f"\nUpdated Salary of {e['name']}:")
            print(json.dumps(e, indent=2))
            return
    print(f"Employee with ID {employee_id} not found.")


def add_employee(employee):
    employees.append(employee)
    print("\nNew Employee Added:")
    print(json.dumps(employee, indent=2))


def delete_employee(employee_id):
    global employees
    before = len(employees)
    employees = [e for e in employees if e["employee_id"] != employee_id]
    if len(employees) < before:
        print(f"\nEmployee with ID {employee_id} deleted.")
    else:
        print(f"Employee with ID {employee_id} not found.")


if __name__ == "__main__":
    find_highest_salary()
    find_average_salary()
    display_data_engineering()
    display_high_earners()
    update_salary(101, 90000)
    add_employee({
        "employee_id": 106,
        "name": "Anjali Mehta",
        "department": "Data Science",
        "salary": 88000,
        "city": "Pune"
    })
    delete_employee(103)
