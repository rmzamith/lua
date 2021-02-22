function getCompleteDays(dateTime1, dateTime2)
    local time1 = os.time(dateTime1)
    local time2 = os.time(dateTime2)
    local secondsDiff = time1 - time2
    return math.floor(secondsDiff / 86400) | 0
end

dateTime1 = os.date("*t", os.time())
dateTime2 = os.date("*t", os.time({
    year = dateTime1.year, 
    month = dateTime1.month, 
    day = dateTime1.day - 35, 
    hour = dateTime1.hour, 
    min = dateTime1.min, 
    sec = dateTime1.sec}))
print(getCompleteDays(dateTime1, dateTime2))