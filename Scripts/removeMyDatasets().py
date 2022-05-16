def remove_mydatasetstext_convert_into_number(datasets_number):
    """Remove text from number, convert to int and return number"""
    temp_string = datasets_number.replace("My Datasets (", "")
    number = temp_string.replace(")", "")
    return int(number)