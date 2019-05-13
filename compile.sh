#! /bin/bash

# Compiles SSH Generate Code

code_name="ssh_generate"
code_src="ssh_generate_dm.c"
output='ssh_generate'
flags='-Wall'
libs='-lm -lfftw3'

print_usage() {
    echo "compile $code_name code."
    echo "=========================="
    echo " " 
    echo "./compile [options]"
    echo " "
    echo "options:"
    echo "-h     show help menu"
    echo "-o     specify output file"
    exit 0
}

while getopts 'ho:' flag; do
    case "${flag}" in
        -h) print_usage ;;
        -o) output="${OPTARG}" ;;
        *) print_usage ;;
    esac
done

# compile ssh
if [ -f "$output" ]; then
    echo "Found $output. Deleting file and all *.o files before compiling."
    echo " "
    rm -f $output
    rm -f *.o
fi
echo "Compiling $code_src to output $output."
gcc $code_src -o $output $flags $libs

