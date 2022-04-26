def remove_comma_and_convert(model_number):
    """Remove comma from number and convert to int"""
    number = model_number.replace(",", "")
    return int(number)