#!/usr/bin/env bash

# The following comments should help you get started:
# - Bash is flexible. You may use functions or write a "raw" script.
#
# - Complex code can be made easier to read by breaking it up
#   into functions, however this is sometimes overkill in bash.
#
# - You can find links about good style and other resources
#   for Bash in './README.md'. It came with this exercise.
#
#   Example:
#   # other functions here
#   # ...
#   # ...

ENCODING_LENGTH=5

init_cipher_dictionary() {
    alphabet=''
    for x in {a..z}; do
        alphabet="$alphabet$x"
    done

    declare -A -g cipher_encode
    for ((i = 0; i < ${#alphabet}; i++)); do
        key="${alphabet:i:1}"
        value="${alphabet:$((${#alphabet} - i - 1)):1}"
        cipher_encode[$key]=$value
    done
    declare -r cipher_encode

    # NOTE: this map has a Z2-symmetry, i.e. the map is it's own inverse; therefore, we
    # don't need to define the dictionary `cipher_decode`.
}

decode() {
    decoded_string=""
    for ((i = 0; i < ${#1}; i++)); do
        letter="${1:i:1}"
        if [[ "${letter}" =~ [a-z] ]]; then
            decoded_string="${decoded_string}${cipher_encode[$letter]}"
        elif [[ "${letter}" =~ [0-9] ]]; then
            decoded_string="${decoded_string}${letter}"
        fi
    done

    echo "${decoded_string}"
}

encode() {
    encoded_string=""
    for ((i = 0; i < ${#1}; i++)); do
        letter="${1:i:1}"
        if [[ "${letter}" =~ [a-z] ]]; then
            encoded_string="${encoded_string}${cipher_encode[${letter}]}"
        elif [[ "${letter}" =~ [0-9] ]]; then
            encoded_string="${encoded_string}${letter}"
        fi
    done

    # add spaces after every ENCODING_LENGTH letter
    encoded_with_space="${encoded_string:0:$ENCODING_LENGTH}"
    for ((i = ENCODING_LENGTH; i < ${#encoded_string}; i += ENCODING_LENGTH)); do
        encoded_with_space="${encoded_with_space} ${encoded_string:i:$ENCODING_LENGTH}"
    done

    echo "${encoded_with_space}"
}

main() {
    case $1 in
    'encode')
        encode "${2,,}"
        ;;
    'decode')
        decode "$2"
        ;;
    *)
        echo "invalide option"
        return 1
        ;;
    esac
}

init_cipher_dictionary

# call main with all of the positional arguments
main "$@"
