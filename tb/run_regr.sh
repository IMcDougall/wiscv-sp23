#! /bin/bash
num_tests=0;
skip_tests=0; # Tests commented in testlists
while read i;
do
num_tests=$((num_tests+1));
if [[ "$i" == *"#"* ]] || [[ "$i" == *"//"* ]]; then
   skip_tests=$((skip_tests+1));
   echo "TEST SKIPPED : $i Reason : Commented in testlist" >>  $2/regression_summary.log
else
    make c_compile sim PROG=$i
    #Handling compile fail in regression
    compile_fail=$(grep -n "Compilation Failed" $2/${i}_run.log | wc -l)
    error_count=$(grep -n "ERROR" $2/${i}_run.log | wc -l)  # First argument is $1 is test list. Second argument is $2 is Test Run folder. Third Argument is NO_DUT 
    echo "error_count = $error_count"
    if [ "$compile_fail" -eq 1 ]; then
         skip_tests=$((skip_tests+1));
         echo "TEST SKIPPED : $i Reason : Program Compile Failed" >>  $2/regression_summary.log
    else 
        if [ "$3" -eq 1 ]; then #NODUT mode
            diff_ret=0;
            mv $2/REF.Trace $2/${i}_REF.Trace
        else
           if [ -f $2/REF.pTrace ]; then
               diff  $2/REF.pTrace $2/DUT.pTrace > /dev/null 2>&1
               diff_ret=$?
               mv $2/REF.pTrace $2/${i}_REF.pTrace
               mv $2/DUT.pTrace $2/${i}_DUT.pTrace
           else 
               diff  $2/REF.Trace $2/DUT.Trace > /dev/null 2>&1
               diff_ret=$?
               mv $2/REF.Trace $2/${i}_REF.Trace
               mv $2/DUT.Trace $2/${i}_DUT.Trace
           fi
        fi
        echo "diff status = $diff_ret"
        if [ "$error_count" -ne 0 ]; then
           echo "Prog : $i Status : FAIL" >> $2/regression_summary.log;
        else if [ "$diff_ret" -ne 0 ]; then
                 echo "Prog : $i Status : RELAX_PASS" >> $2/regression_summary.log;
              else
                 echo "Prog : $i Status : PASS" >> $2/regression_summary.log;
              fi
        fi
    fi
fi
done < $1


pass_count=$(grep -n ": PASS" $2/regression_summary.log | wc -l)
relax_pass_count=$(grep -n "RELAX_PASS" $2/regression_summary.log | wc -l)
fail_count=$(grep -n "FAIL" $2/regression_summary.log | wc -l)

echo "RUN STATISTICS : Total Tests = $num_tests PASS = $pass_count RELAX PASS = $relax_pass_count FAIL = $fail_count SKIPPED = $skip_tests" >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
echo "----------PASS TESTS----------" >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
grep ": PASS" $2/regression_summary.log  >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
echo "----------RELAX PASS TESTS----------" >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
grep "RELAX_PASS" $2/regression_summary.log  >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
echo "----------FAIL TESTS----------" >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
grep "FAIL" $2/regression_summary.log  >> $2/regression_summary2.log
echo -e "------------------------------\n" >> $2/regression_summary2.log
echo "----------SKIPPED TESTS----------" >> $2/regression_summary2.log
grep "SKIP" $2/regression_summary.log  >> $2/regression_summary2.log
mv $2/regression_summary2.log $2/regression_summary.log
