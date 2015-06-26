cmd = "bash"
script = dirname(Base.source_path()) * "/lintrequest.sh"
arg = ARGS[1]
if isfile(".julialint")
	arg = chomp(readlines(".julialint")[1])
end
run(`$cmd $script $arg`)
