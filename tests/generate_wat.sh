HOOKCLEANER=../hook-cleaner

stat $HOOKCLEANER > /dev/null 2> /dev/null
if [ ! "$?" -eq "0" ];
then
    pushd ..
    make
    popd
    stat $HOOKCLEANER > /dev/null 2> /dev/null
    if [ ! "$?" -eq "0" ];
    then
        echo "Hook cleaner not found in parent directory, build attempt failed."
        exit 1
    fi
fi

which wasm2wat > /dev/null 2> /dev/null
if [ ! "$?" -eq "0" ];
then
    echo "wasm2wat not found, please install wabt"
    exit 2
fi

PASSED=0
COUNT=0
TOTALSAVED=0
FAILED=0
for i in `ls *.wasm`; do
    COUNT=`expr $COUNT + 1`
    FN="`echo $i | grep -Eo '^[^\.]+'`"
    rm -f /tmp/t.wasm
    rm -f /tmp/t.wat
    $HOOKCLEANER $i /tmp/t.wasm > /dev/null 2> /dev/null
    R1="$?"
    wasm2wat /tmp/t.wasm -o ./expected_wat/${FN}.wat > /dev/null 2> /dev/null
done
