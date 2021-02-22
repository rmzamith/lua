function getFirstFriday(year)
    local firstDayYear = os.date("*t", os.time({year = year, day = 1, month = 1}))
    local dayOfWeek = firstDayYear["wday"]
    local daysToFriday = 6 - dayOfWeek
    if daysToFriday < 0 then
        daysToFriday = 6
    end
    firstDayYear["day"] = firstDayYear["day"] + daysToFriday
    return firstDayYear
end

firstFriday = getFirstFriday(2011)
print(os.date("%d/%m/%Y", os.time(firstFriday)))