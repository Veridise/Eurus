#!/bin/bash
# this.sh <basedir>

# process all contracts
basedir="$1/"
outputdir="$1/output/"
# create output folder if it doesn't exist
mkdir -p ${outputdir}

# status keeper
isfail=false
allsyms=""

# clean: delete all *.yul and *.json files
echo -n "# cleaning up ...... "
find ${outputdir} -name "*.yul" -type f -delete
find ${outputdir} -name "*.json" -type f -delete
echo "success"

# then test whether all files are compilable, this does not include hardhat and aave files
for folder in ${basedir}; do
    # if a file is used, it will be dragged and compiled by the contract that uses it
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# testing: ${f} ...... "
        output=$(solc ${f} --base-path ${basedir} 2>&1 1>/dev/null)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
            echo "${output}"
            exit 1
        else
            echo " success"
        fi
    done
done

# then compile all sol files to yul, this does not include hardhat and aave files
for folder in ${basedir}; do
    # if a file is used, it will be dragged and compiled by the contract that uses it
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# compiling to Yul: ${f} ...... "
        dd="$(dirname "${f}")"
        output=$(solc ${f} --overwrite --ir --base-path ${basedir} -o ${outputdir} 2>&1 1>/dev/null)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
            echo "${output}"
            exit 1
        else
            echo " success"
        fi

        # grab new linkersymbol each time you get new yul, because in some files the path may change
        # so we want to grab all of them, otherwise some may lost due to overwrite
        newsym="$(grep -rho --include="*.yul" "linkersymbol\(.*\)" ${outputdir} | sort -u)"
        allsyms="$(echo -e "${allsyms}\n${newsym}" | sort -u -t"\n")"
    done
done

# then get all abi specifications
for folder in ${basedir}; do
    # if a file is used, it will be dragged and compiled by the contract that uses it
    files=$(find ${folder} -name '*.sol')

    for f in ${files}; do
        echo -n "# extracting abi specifications: ${f} ...... "
        dd="$(dirname "${f}")"

        output0=$(solc ${f} --base-path ${basedir} --abi 2>/dev/null | sed -nE 's/^======= .*:(.*) =======$/\1/p')
        if [ $? -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
            echo "${output0}"
            exit 1
        fi
        
        # for actual json, you need to separate them using \n, otherwise plain loop will separate them using whitespace
        # which is not the intended behavior
        # ref: https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
        tmpoutput1=$(solc ${f} --base-path ${basedir} --abi 2>/dev/null | sed -nE 's/^(\[.*\])$/\1/p')
        IFS=$'\n'; output1=($tmpoutput1); unset IFS;
        # output0 is list of contract names
        # output1 is list of abi jsons
        if [ $? -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and compile again"
            echo "${tmpoutput1}"
            exit 1
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
                echo "${j}" > ${outputdir}/$1.abi.json
                shift
            done
            # echo " success"
        fi
    done
done

# Eurus translation
for folder in ${outputdir}; do
    # you don't want to include *.eurus.yul and translate again
    files=$(find ${folder} -name '*.yul' ! -name '*.eurus.yul')

    for f in ${files}; do
        echo -n "# Eurus translate: ${f} ...... "
        if [ -s ${f} ]; then
            output=$(python ../utils/yul_translator.py --yul ${f} 2>&1 1>/dev/null)
            retval=$?
            if [ $retval -ne 0 ]; then
                isfail=true
                echo " failed, please fix errors and try again"
                echo "${output}"
                exit 1
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
for folder in ${outputdir}; do
    files=$(find ${folder} -name '*.eurus.yul')

    for f in ${files}; do
        echo -n "# Eurus parse: ${f} ...... "
        output=$(python ../utils/yul_parser.py --yul ${f} 2>&1 1>/dev/null)
        retval=$?
        if [ $retval -ne 0 ]; then
            isfail=true
            echo " failed, please fix errors and try again"
            echo "${output}"
            exit 1
        else
            echo " success"
        fi
    done
done

# then figure out the set of linker symbols and nofity the user
# syms="$(grep -rho --include="*.yul" "linkersymbol\(.*\)" ${outputdir} | sort -u)"
echo "======================================================"
echo "Please set addresses for the following linker symbols:"
echo "======================================================"
for sym in ${allsyms}; do
    # echo "# found linker symbol: ${sym}"
    echo "${sym}"
done
echo "======================================================"
if ${isfail}; then
    echo "Some procedures failed. Search \"fail\" in the log to locate and fix them."
else
    echo "No errors found. You are good to go."
fi

# return success signal
exit 0