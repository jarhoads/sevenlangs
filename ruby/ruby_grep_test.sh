#!/bin/bash	
# test for ruby_grep.rb

echo "Testing finding one word"
ruby ruby_grep.rb this ruby_grep_test_file.txt

echo "Testing finding one word on all lines"
ruby ruby_grep.rb here ruby_grep_test_file.txt

echo "Testing finding last word"
ruby ruby_grep.rb there ruby_grep_test_file.txt
