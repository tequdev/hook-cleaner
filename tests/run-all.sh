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
    rm -f /tmp/t.wasm
    rm -f /tmp/t.wat
    $HOOKCLEANER $i /tmp/t.wasm > /dev/null 2> /dev/null
    R1="$?"
    wasm2wat /tmp/t.wasm > /dev/null 2> /dev/null
    R2="$?"

    FN="`echo $i | grep -Eo '^[^\.]+'`"
    EXPECTED_WAT="./expected_wat/${FN}.wat"
    FAIL=0
    OUTCOME="FAIL"
    if [ $R1 -eq "0" ];
    then
        if [ $R2 -eq "0" ];
        then
            wasm2wat /tmp/t.wasm -o /tmp/t.wat > /dev/null 2> /dev/null
            if [ ! -f "$EXPECTED_WAT" ];
            then
                FAIL=1
                OUTCOME="FAIL missing expected_wat"
            else
                diff -q /tmp/t.wat "$EXPECTED_WAT" > /dev/null 2> /dev/null
                if [ ! "$?" -eq "0" ];
                then
                    FAIL=1
                    OUTCOME="FAIL output mismatch"
                else
                    BEFORE="`du -b $i | grep -Eo '^[0-9]+'`"
                    AFTER="`du -b /tmp/t.wasm | grep -Eo '^[0-9]+'`"
                    SAVED="`expr $BEFORE - $AFTER`"
                    OUTCOME="PASS (-$SAVED b)"
                    TOTALSAVED="`expr $TOTALSAVED + $SAVED`"
                    PASSED="`expr $PASSED + 1`"
                fi
            fi
        else
            FAIL=1
            OUTCOME="FAIL wasm2wat"
        fi
    else
        FAIL=1
        OUTCOME="FAIL"
    fi
    if [ "$FAIL" -eq "1" ];
    then
        FAILED=`expr $FAILED + 1`
    fi
    printf "TEST %2d -- %-16s -- %s\n" "$COUNT" "$FN" "$OUTCOME"
done

if [ "$FAILED" -eq "0" ];
then
    echo "All tests passed! Average bytes saved: `expr $TOTALSAVED / $COUNT` b"
else
    echo "NOT All tests passed: `expr $COUNT - $PASSED` failed."
    exit 1
fi
