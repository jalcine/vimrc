" Just for my sake, add some commands for Maven.
command! -buffer -nargs=1 Maven :echo system("mvn <args>")
command! -buffer -nargs=1 Ant :echo system("ant <args>")
