#!/bin/bash
SUCCESS=0
FAIL=0
COUNTER=0
DIFF=""

s21_command=(
    "./s21_grep"
    )
sys_command=(
    "grep"
    )

manual=(
"int test_files/test_1_grep.txt"
"-e char test_files/test_5_grep.txt"
"-i int test_files/test_2_grep.txt"
"-v char test_files/test_5_grep.txt"
"-c drinks test_files/test_6_grep.txt"
"-l int test_files/test_1_grep.txt"
"-n for test_files/test_1_grep.txt"
"-h for test_files/test_1_grep.txt"
"-o for test_files/test_1_grep.txt"
"-s for test_files/test_1_grep.txt"
"-n for test_files/test_1_grep.txt test_files/test_2_grep.txt"
"-n -e ^\} test_files/test_1_grep.txt"
"-e ^int test_files/test_1_grep.txt"
"-e"
"-f test_files/test_grep_grep.txt test_files/test_1_grep.txt test_files/test_5_grep.txt"
"-ie INT test_files/test_5_grep.txt"
"-iv int test_files/test_5_grep.txt"
"-in int test_files/test_5_grep.txt"
"-ic int test_files/test_5_grep.txt"
"-ih int test_files/test_6_grep.txt"
"-il test test_files/test_7_grep.txt"
"-io test test_files/test_7_grep.txt"
"-vi int test_files/test_2_grep.txt"
"-ve int test_files/test_2_grep.txt"
"-vc int test_files/test_2_grep.txt"
"-vl int test_files/test_2_grep.txt"
"-vn int test_files/test_2_grep.txt"
"-vh int test_files/test_2_grep.txt"
"-vo int test_files/test_3_grep.txt"
"-ci int test_files/test_2_grep.txt"
"-ce int test_files/test_2_grep.txt"
"-co int test_files/test_2_grep.txt"
"-cv int test_files/test_2_grep.txt"
"-ch int test_files/test_2_grep.txt"
"-cs int test_files/test_2_grep.txt"
"-co int test_files/test_2_grep.txt"
"-li int test_files/test_2_grep.txt"
"-le int test_files/test_2_grep.txt"
"-lo int test_files/test_2_grep.txt"
"-lh int test_files/test_2_grep.txt"
"-ls int test_files/test_2_grep.txt"
"-lv int test_files/test_2_grep.txt"
"-lo int test_files/test_2_grep.txt"
"-ni test test_files/test_7_grep.txt"
"-ne test test_files/test_7_grep.txt"
"-nv test test_files/test_7_grep.txt"
"-nh test test_files/test_7_grep.txt"
"-nc test test_files/test_7_grep.txt"
"-ns test test_files/test_7_grep.txt"
"-no test test_files/test_7_grep.txt"
"-hi test test_files/test_7_grep.txt"
"-he test test_files/test_7_grep.txt"
"-hv test test_files/test_7_grep.txt"
"-hc test test_files/test_7_grep.txt"
"-hl test test_files/test_7_grep.txt"
"-hn test test_files/test_7_grep.txt"
"-hs test test_files/test_7_grep.txt"
"-ho test test_files/test_7_grep.txt"
"-si test test_files/test_7_grep.txt"
"-sv test test_files/test_7_grep.txt"
"-sh test test_files/test_7_grep.txt"
"-sc test test_files/test_7_grep.txt"
"-sn test test_files/test_7_grep.txt"
"-so test test_files/test_7_grep.txt"
"-se test test_files/test_7_grep.txt"
"-oi int test_files/test_2_grep.txt"
"-oc int test_files/test_2_grep.txt"
"-ol int test_files/test_2_grep.txt"
"-on int test_files/test_2_grep.txt"
"-oh int test_files/test_2_grep.txt"
"-os int test_files/test_2_grep.txt"
"-oe int test_files/test_2_grep.txt"
"-iv int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ic int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-il int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-in int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-is int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-io int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vi int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vc int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vl int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vn int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vo int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-vs int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ci int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-cv int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-cs int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-co int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-li int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-lv int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-lh int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ni int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-nv int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ns int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-no int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-hl int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-si int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-sv int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-sc int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-sl int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-sn int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-so int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-oi int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-os int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-oc int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ol int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-on int test_files/test_5_grep.txt test_files/test_2_grep.txt"
"-ne ) test_files/test_5_grep.txt"
"-l for test_files/test_1_grep.txt test_files/test_2_grep.txt"
"-l -e include -e char test_files/test_1_grep.txt test_files/test_2_grep.txt"
"-h -e include -e char test_files/test_1_grep.txt test_files/test_2_grep.txt"
"-e int test_files/test_4_grep.txt"
)

run_test() {
    param=$(echo "$@" | sed "s/FLAGS/$var/")
    "${s21_command[@]}" $param > "${s21_command[@]}".log
    "${sys_command[@]}" $param > "${sys_command[@]}".log
    DIFF="$(diff -s "${s21_command[@]}".log "${sys_command[@]}".log)"
    let "COUNTER++"
    if [ "$DIFF" == "Files "${s21_command[@]}".log and "${sys_command[@]}".log are identical" ]
    then
        let "SUCCESS++"
        echo "$COUNTER - Success $param"
    else
        let "FAIL++"
        echo "$COUNTER - Fail $param"
    fi
    rm -f "${s21_command[@]}".log "${sys_command[@]}".log
}


for i in "${manual[@]}"
do
    var="-"
    run_test "$i"
done

printf "\n"