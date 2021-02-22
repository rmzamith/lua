function mkdir(path)
    os.execute("mkdir "..path)
end

function removeDir(path)
    os.execute("rm -rf "..path)
end

function ls(path)
    os.execute("ls "..path)
end

mkdir(arg[1])
os.execute("pwd")
os.execute(string.format("cd %s; pwd; touch test; cd ..", arg[1]))
ls(arg[1])
removeDir(arg[1])
os.execute("pwd")