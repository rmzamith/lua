function addOneMonth(dateTime)
    dateTime["month"] = dateTime["month"] + 1
    return os.date("*t", os.time(dateTime))
end

currDate = os.date("*t", os.time())
print(os.date("%d/%m/%Y", os.time(currDate)))
print(os.date("%d/%m/%Y", os.time(addOneMonth(currDate))))