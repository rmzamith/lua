function returnDayOfWeek(dateTime)
    return dateTime["wday"]
end

print(returnDayOfWeek(os.date("*t")))