#!/bin/bash
# note: run this from the examples folder
# note: you need openzeppelin files ready

# for atual testing
targetdir="./symex/"
eurusdir="./"

# status keeper
isfail=false

# clean: delete all *.yul and *.json files
echo -n "# cleaning up ...... "
find ${targetdir} -name "*.yul" -type f -delete
find ${targetdir} -name "*.json" -type f -delete
echo "success"

# first replace all to 0.8.13, since Yul fails on some of 0.8.13 files
# add *.sol to avoid replacing the script itself
if [[ "$OSTYPE" == "darwin"* ]]; then
    # mac
    echo -n "# mac: replacing pragma versions ...... "
    grep -Irl --include="*.sol" "0.8.0" ${targetdir} | xargs sed -i "" -e 's/0.8.0/0.8.13/g'
    echo " success"
else
    # others
    echo -n "# others: replacing pragma versions ...... "
    grep -Irl --include="*.sol" "0.8.0" ${targetdir} | xargs sed -i 's/0.8.0/0.8.13/g'
    echo " success"
fi

# then test whether all files are compilable, this does not include hardhat and aave files
for folder in ${targetdir}; do
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# testing: ${f} ...... "
        output=$(solc ${f} --overwrite @Eurus=${eurusdir} > /dev/null 2>&1)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
        else
            echo " success"
        fi
    done
done

# then compile all sol files to yul, this does not include hardhat and aave files
for folder in ${targetdir}; do
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# compiling to Yul: ${f} ...... "
        dd="$(dirname "${f}")"
        output=$(solc ${f} --ir --overwrite @Eurus=${eurusdir} -o ${dd} > /dev/null 2>&1)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
        else
            echo " success"
        fi
    done
done

# then get all abi specifications
for folder in ${targetdir}; do
    # exclude openzeppelin library file, if a file is used, it will be dragged and compiled by the contract that uses it
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# extracting abi specifications: ${f} ...... "
        dd="$(dirname "${f}")"

        output0=$(solc ${f} --overwrite @Eurus=${eurusdir} --abi 2>/dev/null | sed -nE 's/^======= .*:(.*) =======$/\1/p')
        if [ $? -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
        fi
        
        # for actual json, you need to separate them using \n, otherwise plain loop will separate them using whitespace
        # which is not the intended behavior
        # ref: https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
        tmpoutput1=$(solc ${f} --overwrite @Eurus=${eurusdir} --abi 2>/dev/null | sed -nE 's/^(\[.*\])$/\1/p')
        IFS=$'\n'; output1=($tmpoutput1); unset IFS;
        # output0 is list of contract names
        # output1 is list of abi jsons
        if [ $? -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
        else
            # newline
            echo ""
            # echo "  # all contract names are: ${output0}"
            # loop over two variables
            # ref: https://unix.stackexchange.com/questions/386492/how-to-iterate-a-command-with-two-different-variables
            set -- ${output0}
            # for j in ${output1}; do
            for j in "${output1[@]}"; do
                echo "  # $1"
                echo "${j}" > ${dd}/$1.abi.json
                shift
            done
            # echo " success"
        fi
    done
done

# Eurus translation
for folder in ${targetdir}; do
    # you don't want to include *.eurus.yul and translate again
    files=$(find ${folder} -name '*.yul' ! -name '*.eurus.yul')

    for f in ${files}; do
        echo -n "# Eurus translate: ${f} ...... "
        if [ -s ${f} ]; then
            output=$(python ../utils/yul_translator.py --yul ${f} > /dev/null 2>&1)
            retval=$?
            if [ $retval -ne 0 ]; then
                isfail=true
                echo " failed, please fix errors and try again"
            else
                echo " success"
            fi
        else
            # empty files could be interfaces
            rm ${f}
            echo "  empty file, delete and skip"
        fi
    done
done

# Eurus parse
for folder in ${targetdir}; do
    files=$(find ${folder} -name '*.eurus.yul')

    for f in ${files}; do
        echo -n "# Eurus parse: ${f} ...... "
        output=$(python ../utils/yul_parser.py --yul ${f} > /dev/null 2>&1)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and try again"
        else
            echo " success"
        fi
    done
done

# then figure out the set of linker symbols and nofity the user
syms="$(grep -rho --include="*.yul" "linkersymbol\(.*\)" ${targetdir} | sort -u)"
echo "======================================================"
echo "Please set addresses for the following linker symbols:"
echo "======================================================"
for sym in ${syms}; do
    # echo "# found linker symbol: ${sym}"
    echo "${sym}"
done

echo "======================================================"
if ${isfail}; then
    echo "Some procedures failed. Search \"fail\" in the log to locate and fix them."
else
    echo "No errors found. You are good to go."
fi