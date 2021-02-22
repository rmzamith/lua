function getCompleteMonths(dateTime1, dateTime2)
    local year1, month1 = dateTime1.year, dateTime1.month
    local year2, month2 = dateTime2.year, dateTime2.month
    local yearDiff, monthDiff = year1 - year2, month1 - month2
    return yearDiff * 12 + monthDiff
end

dateTime1 = os.date("*t", os.time())
dateTime2 = os.date("*t", os.time({
    year = dateTime1.year - 1, 
    month = dateTime1.month, 
    day = dateTime1.day - 35, 
    hour = dateTime1.hour, 
    min = dateTime1.min, 
    sec = dateTime1.sec}))
print(getCompleteMonths(dateTime1, dateTime2))