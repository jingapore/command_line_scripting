# ${#} and ${@}
`${#}` gives the number of positional arguments. `${@}` gives the positional parameters.

`FUNCNAME` is supposed to be an array of positional arguments of shell functions currently in the execution call stack. If a script invokes `FUNCNAME`, and the script is sourced from another scripe (e.g. `parameters_source.sh` running `source parameters.sh`, where latter invokes `FUNCNAME`), then `FUNCNAME` will have two positional arguments: (1) `source`. But note that `${#FUNCNAME[@]}` does not give the number of positional arguments if it is not invoked within a function. This is a bash bug.

# getopts

`getopts` parses options and arguments in bash. It is a more general function implemented in C, and has two arguments. (1) `argv` where each element starts with `-` (2) `argc` which is count of elements in argv.

    while getopts :<option and args> opt do
        case $<opt> in
            a) ;;
            b) ;;
    done

Insert `<options and args>` where for each is `<option>:<arg>` or simply `<option>` if there is no arg <br>
So, it is possible for `:<option_a><option_b><option_c with arg>:<option_d>`.

Option will match `?` in case statement, if option does not exist.<br>
Option will match `:` in case statement, if argument does not exist. I infer that `getopts` parses the option's argument first, because the case match with option would not appear if argument does not exist.  If the first character of optstring is a colon (`:` If the first character (following any optional '+' or '-' described above) of optstring is a colon (':'), then getopt() returns ':' instead of '?' to indicate a missing option argument.), then `getopt` returns `:` instead of `?` to indicate a missing option argument.

The colon preceding `<options and args>` suppresses error messages, and leaves it to the script to display error messages.

How does `OPTIND` work?
- For `-wt`, after parsing the option `w`, `OPTIND` does not increment.
- By comparison for `-w -t`, after parsing the option `w`, `OPTIND` increments.
- So, `-wt` is taken as one element in `argv`.

If one includes `exist` after each case, then the while loop ends and the script exits in its entirety. I.e. all remaining commands do not run.

    while getopts :<option and args> opt do
        case $<opt> in
            a) <insert script> exit 0;;
            b) <insert script> exit 0;;
    done

    <remaining script that does not run, if there is a match above>

References:
- https://linuxconfig.org/how-to-use-getopts-to-parse-a-script-options
- https://wiki.bash-hackers.org/howto/getopts_tutorial
- https://sookocheff.com/post/bash/parsing-bash-script-arguments-with-shopts/