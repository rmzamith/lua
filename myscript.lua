s = string.pack("i4", 1000)
for i = 1, #s do print((string.unpack("b", s, i))) end