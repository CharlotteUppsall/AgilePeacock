def transfigure_into_number(item_number):
    """Remove text firstly. Convert a String to an integer and then return a number"""
    number = item_number.replace("Total items: ","")
    return int(number)
