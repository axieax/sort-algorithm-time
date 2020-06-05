#!/bin/sh

for n in 5000 10000 20000 40000 50000 60000 80000 90000 100000 150000 200000 250000
do
    # Generates Random List
    # Has duplicates
    ./randList $n > tests/d_random_$n
    sort -n < tests/d_random_$n > tests/d_sorted_$n
    sort -nr < tests/d_random_$n > tests/d_reverse_$n
    # No duplicates
    seq $n > tests/nd_sorted_$n
    sort -R < tests/nd_sorted_$n > tests/nd_random_$n
    sort -nr < tests/nd_sorted_$n > tests/nd_reverse_$n
    
    # Record Timing Data
    echo ============================================================================================================================================================
    echo ============================= N = $n =============================
    echo ====================== Random No Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/nd_random_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/nd_random_$n > /dev/null
        echo ""
    done

    echo ====================== Sorted No Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/nd_sorted_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/nd_sorted_$n > /dev/null
        echo ""
    done
    

    echo ====================== Reverse No Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/nd_reverse_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/nd_reverse_$n > /dev/null
        echo ""
    done


    echo ====================== Random With Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/d_random_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/d_random_$n > /dev/null
        echo ""
    done

    echo ====================== Sorted With Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/d_sorted_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/d_sorted_$n > /dev/null
        echo ""
    done

    echo ====================== Reverse With Duplicates ======================
    echo ""
    for i in 1 2 3
    do
        echo - useIntList Trial $i:
        time ./useIntList < tests/d_reverse_$n > /dev/null
        echo ""
    done
    for i in 1 2 3
    do
        echo - sort Trial $i:
        time sort < tests/d_reverse_$n > /dev/null
        echo ""
    done
    echo ""
    echo ""
done
