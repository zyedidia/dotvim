cmd = "bash"
file = dirname(Base.source_path()) * "/lintrequest.sh"
arg = ARGS[1]
if isfile(".julialint")
	arg = strip(readlines(".julialint")[1], "\n")
end
run(`$cmd $file $arg`)
