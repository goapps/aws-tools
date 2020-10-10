#! /bin/sh
# file: tests/cli_test.sh

testAWSCheckOptionDoesNotExist() {
    ../aws-auth -c /usr/does-not-exist >> $stdoutF 2>&1
    assertEquals 10 $?
}

testAWSCheckOptionDoesExist() {
    ../aws-auth -c ls >> $stdoutF 2>&1
    assertEquals 13 $?
}

testAWSCheckOptionEmpty() {
    ../aws-auth -c >> $stdoutF 2>&1
    assertEquals 14 $?
}

testAWSCheckENVDoesNotExist() {
    export AWS_AUTH_CLI_PATH=""
    ../aws-auth 123456 >> $stdoutF 2>&1
    assertEquals 10 $?
}

testAWSCheckENVExist() {
    export AWS_AUTH_CLI_PATH="ls"
    ../aws-auth 123456 >> $stdoutF 2>&1
    assertEquals 13 $?
}

tearDown() {
    unset AWS_AUTH_CLI_PATH
}

oneTimeSetUp() {
    outputDir="${SHUNIT_TMPDIR}/output"
    mkdir "${outputDir}"
    stdoutF="${outputDir}/stdout"
    stderrF="${outputDir}/stderr"
    testDir="${SHUNIT_TMPDIR}/aws-auth"
}

# oneTimeTearDown() {
    # echo "Test logs: $testDir"
    # rm -fr "${testDir}"
# }

# load shunit2
shunit2=`which shunit2`
. shunit2