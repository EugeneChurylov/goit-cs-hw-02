name = input("Enter your name: ")
surname = input("Enter your surname: ")

while True:
    try:
        age = int(input("Enter your age: "))
        print(f"Hello {name.capitalize()} {surname.capitalize()}! You are {age} years old!")
        break
    except ValueError:
        print("Enter a number")
