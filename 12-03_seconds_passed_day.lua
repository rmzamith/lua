function getSecondsPassed(dateTimeSeconds)
    local dt = os.date("*t", dateTimeSeconds)
    local dtBeginningDay = os.time({year = dt["year"], month = dt["month"], day = dt["day"], hour = 0, min = 0, sec = 0})
    return os.difftime(os.time(dt), dtBeginningDay)
end

secondsElapsed = getSecondsPassed(os.time())
print("seconds "..secondsElapsed)