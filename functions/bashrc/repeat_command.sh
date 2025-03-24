# repeat command n times (e.g. to repeat pytest)

# Rest of .bashrc could be here, but you don't have to define this function at the end of the file

repeat() {
        shopt -s expand_aliases # enable alias expansion
        local n=$1
        shift # pop first argument and shift others down
        local usage="Usage: repeate <n> <command> "
        if [[ -z $n || $# -eq 0 ]]; then # check that at least 2 arguments exist
                echo $usage >&2
                return 1
        fi
        if [[ $n =~ ^[0-9]+$ ]]; then # n == only an integer without pre- or suffix
                for ((i=1; i<=n; i++)); do
                        # we use eval so the commands defined by alias are also valid
                        eval "$*"
                done
        else
                echo "n must be a positive integer."
                return 2 # different exit code from the argument exception
        fi
}

