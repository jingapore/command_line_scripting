set -e
echo "\$0 is: $0"
echo "\$1 is: $1"
echo "Positional params in FUNCNAME are: ${FUNCNAME[@]}"
echo "Running \${#FUNCNAME[@]} is: ${#FUNCNAME[@]}"
echo ${FUNCNAME[0]}
echo ${FUNCNAME[1]}
echo ${BASH_SOURCE}
echo "${#} parameters passed"
echo "parameters are: ${@}"
# echo "Running \${@#hello} ${@#hello}"
# if [ "${#FUNCNAME[@]}" -ge 2 ];
if [ "${#}" -ge 2 ]
then
    echo "Number of params is -ge 2"
else
    echo "Number of params is NOT -ge 2"
fi;
# _is_sourced() {
# 	# https://unix.stackexchange.com/a/215279
# 	local result=[ "${#FUNCNAME[@]}" -ge 2 ] \
# 		&& [ "${FUNCNAME[0]}" = '_is_sourced' ] \
# 		&& [ "${FUNCNAME[1]}" = 'source' ]
#     echo $result
# }

_is_sourced() {
    echo "Running \${#FUNCNAME[@]} in _is_sourced(): ${#FUNCNAME[@]}" #i do not yet understand why ${#FUNCNAME[@]} returns 0 when outside 
}

echo $(_is_sourced);