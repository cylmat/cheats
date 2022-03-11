Find | xargs
===

## Samples
- Find file from root 
find / -name <file>

- Sed each .sh files
find . -name "*.sh" -exec sed -i 's/search/replace/' {} \;

- test itération sur les fichiers logs
find ./src -iregex '.*\.log$' -print0 | xargs -0 file  
find -iname '*.txt' -execdir ls {} \;  
cat `find src -maxdepth 1 -name *.php`

- tuer tous les process au $motif
ps -ax | grep "${motif}" | grep -v "grep" | awk '{print $1}'| xargs kill -9  

- lister les infos
find . -type f -name "*.txt" -print | xargs ls -l -D %Y-%m-%d  
ls -1 ./src/*.txt | xargs -n1 basename  

- recherche 'smile' dans chaque fichier json trouvé
find -maxdepth 1 -regex '.*.json' | xargs grep smile
  
## find -exec \; vs find -exec \+
find . -name 'test*' -exec echo {} \;
- ./test.c
- ./test.cpp
- ./test.new
  
where find . -name 'test*' -exec echo {} \+
- ./test.c ./test.cpp ./test.new

---
# sample
- https://www.everythingcli.org/find-exec-vs-find-xargs/

1. Search within files
Search for files only that end with .php and look for the string $test inside those files:
* find -exec \;
find . -name \*.php -type f -exec grep -Hn '$test' {} \;

* find | xargs -n1
find . -name \*.php -type f -print0 | xargs -0 -n1 grep -Hn '$test'

# Getting directory size
# '| wc -l' will print the number of lines found instead of the results

# time find -exec \;
find . -name \*.php -type f -exec grep -Hn '$test' {} \; | wc -l
  2213

No difference either, let’s look at the commands in detail.
1.1 What is equal in find -exec
find .
# find all files, folders, symlinks, etc in the current directory recursively

find . -name \*.php
# find all files, folders, symlinks, etc in the current directory recursively
# Its filename must end with .php

find . -name \*.php -type f
# find all files, folders, symlinks, etc in the current directory recursively
# Its filename must end with .php
# Only search for files (not folders)

find . -name \*.php -type f -exec [cmd]
# find all files, folders, symlinks, etc in the current directory recursively
# Its filename must end with .php
# Only search for files (not folders)
# Execute a command on the results

The above is all the same for all three queries. Let’s have a look at the grep command:
grep -H
# -H  Always print filename headers with output lines.

grep -Hn
# -H  Always print filename headers with output lines.
# -n  Each output line is preceded by its relative line number in the file, starting at line 1.

1.2 What is different in find -exec
1.2.1 find \;
find . [args] -exec [cmd] {} \;

{} Is a placeholder for the result found by find \; Says that for each found result, the command (in this case ‘grep’) is executed once with the found result
So in the above example ‘grep’ is executed as many times as a file with the specified pattern has been found:
grep [...] file1
grep [...] file2
...

1.2.2 find +
find . [args] -exec [cmd] {} \+

{} Is a placeholder for the result found by find \+ All result lines are concatenated and the command (in  this case ‘grep’) is executed only a single time with all found results  as a parameter
So in the above example ‘grep’ is executed only once and its parameter are all files found with the specified pattern.
grep [...] file1 file2 ...

1.3 What is equal in find | xargs
find . [args] -print0 | xargs -0 [cmd]

-print0 Tells find to print all results to std, each separated with the ASCII NUL character ‘\000’ -0 Tells xargs that the input will be separated with the ASCII NUL character ‘\000’
You have to use both or neither of them. The advantage is that all  results will be handed over to xargs as a single string without newline  separation. NUL charater separation is a way to escape files which also  contain spaces in their filenames.
All reults by find are piped to xargs and you can now execute commands on them.
1.4 What is different in find | xargs
1.4.1 xargs with -n1
find .[args] -print0 | xargs -0 -n1 [cmd]

-n1 Tells xarg to execute the command [cmd] with only one argument (In this case only one file found by find). This is equal to:
find . -exec [cmd] {} \;

So in the above example ‘grep’ is executed as many times as a file with the specified pattern has been found:
grep [...] file1
grep [...] file2
...

1.4.2 xargs without -n
find .[args] -print0 | xargs -0 [cmd]

If no -n[int] is specified, xargs uses the default of -n5000 (see man xargs). This means that xargs uses up to 5000 parameters for the command and executes it once, instead of 5000 times. This is equal to:
find . -exec [cmd] {} +;

So in the above example ‘grep’ is executed only once and its parameter are all files found with the specified pattern.
grep [...] file1 file2 ... file5000
grep [...] file5001 file5002 ...

1.5 Performance
Let’s see how those commands scale on a large folder with 37 GB of files.
du -hd0
37G    .

# 'time' will print the total time taken for the command to finish

# time find -exec \;
time find . -name \*.php -type f -exec grep -Hn '$test' {} \;
real    1m24.433s
user    0m29.022s
sys    0m43.304s

# find -exec \+
time find . -name \*.php -type f -exec grep -Hn '$test' {} \+
real    0m13.050s
user    0m5.315s
sys    0m2.179s

# find | xargs -n1
time find . -name \*.php -type f -print0 | xargs -0 -n1 grep -Hn '$test'
real    0m55.159s
user    0m23.692s
sys    0m28.618s

# find | xargs
time find . -name \*.php -type f -print0 | xargs -0 -grep -Hn '$test'
real    0m12.047s
user    0m4.997s
sys    0m3.593s

So obviously find + and xargs (without -n1) are much faster because  there is no overhead in fork and exec. It decreases I/O dramatically and  seen from the times commands they are up to 6x faster.
1.6 Difference between find -exec and find | xargs
Now that each find command and each xargs command has been discussed,  there is still a difference between the actual find -exec and find |  xargs.
1.6.1 Exit code
find -exec returns the exit code of find itself instead of the subcommand. find | xargs returns the exit code of the subcommand.
1.6.2 Parallelism
If you use find | xargs to execute each command separately (-n1) you  can also do that in parallel mode in order to boost performance. Let’s check out the performance again on an 8-core processor with 8 simultaneous xargs processes (-P8)
# find | xargs -n1 -P8
time find . -name \*.php -type f -print0 | xargs -0 -n1 -P8 grep -Hn '$test'
real    0m14.026s
user    0m32.960s
sys    0m39.009s

This seems to be much faster than in normal mode.
Finally let’s have a look at another example to evaluate the exit code.
2. Check PHP files for syntax errors
In this example I want to find PHP syntax errors in all php files in the current directory recursively
2.1 Note
In this example we cannot use \+ for find and must use -n1 for xargs, because the subcommand php -l only accepts one file at a time.
2.2 find -exec
find . -name \*.php -type f -exec php -l {} \;
...
PHP Parse error:  syntax error, unexpected '=' in ./test.php on line 3

Parse error: syntax error, unexpected '=' in ./test.php on line 3
Errors parsing ./test.php
...
No syntax errors detected in ./everythingcli/wordpress/wp-admin/network/user-new.php

...

* Even though php -l fails and exits with 1 somewhere at the beginning, find -exec continues and finally exits with zero.
2.3 find | xargs
find . -name \*.php -type f -print0 | xargs -0 -n1 php -l
...
PHP Parse error:  syntax error, unexpected '=' in ./test.php on line 3

Parse error: syntax error, unexpected '=' in ./test.php on line 3
Errors parsing ./test.php

* The command immediately stops executing. Why? Because the subcommand  failed and this is the nature of piping commands. We can now see the  main difference between find -exec and find | xargs:
find -exec will continue on every file, even if -exec fails, but find | xargs will immediately stop once there is an error in the piped command.
3. Conclusion
3.1 Parameter Method
It depends on the subcommand whether you have to use \; for find and  -n1 for xargs. If the subcommand is able to use multiple inputs, then  use + and no -n1. If the subcommand can only take one argument, you have  to use \; and -n1.
3.2 find -exec vs find | xargs
If you need to stop the execution on failed subcommands, you need to  use xargs. If you want or need to continue the on failed subcommands you  have to use find -exec.
3.3 More on xargs
xargs has some additional useful parameter you should be aware of:
-t  # print each command prior execution
-p  # print each command and ask to execute it
-x  # make xargs quit if the nummber of arguments does not fit into the command line length

  
