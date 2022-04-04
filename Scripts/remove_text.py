def convert_into_number(model_number):
    """Remove parenthesis from number and return number"""
    new_string = model_number.replace("My Models (", "")
    number = new_string.replace(")", "")
    return int(number)