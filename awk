The term "awk" itself does not have a specific full form. It is derived from the surnames of its three original authors: Alfred Aho, Peter Weinberger, and Brian Kernighan. These three computer scientists developed the AWK programming language and its associated tool, which is widely used for text processing and data manipulation tasks.

AWK (Pattern Scanning and Processing Language): AWK is a more comprehensive language for processing and manipulating structured text data. It is particularly well-suited for working with columns or fields of data, performing calculations, conditional processing, and generating reports.
Syntax:

AWK: AWK has a more complex syntax and supports a wider range of operations. It uses patterns, actions, and variables. The general structure is pattern { action }, where the pattern specifies when the action should be applied.
Field and Column Manipulation:

awk 'pattern { action }' file
> Print entire file

awk '1 { print }' file
{ print } is the default action block that will be used by AWK if you do not explicitly specify one.
awk 1 file // will print entire file

> Remove a file header
awk 'NR>1' file // NR – The current input record number.

> Print lines in a range 2, 3
awk 'NR>1 && NR < 4' file

> Removing whitespace-only lines
awk 'NF' file // NF The number of fields in the current record. If you are using the standard “white space” delimiter for your fields

> Removing all blank lines
awk '1' RS='' file // RS The record separator. 

> Extracting fields

awk '{ print $1, $3}' FS=, OFS=, file
awk 'BEGIN { FS=OFS="," } NF { print $1, $3 }' file
Use a special BEGIN block inside the AWK program to initialize those variables before the first record is read
> Performing calculations column-wise

awk '{ SUM=SUM+$1 } END { print SUM }' FS=, OFS=, file
use END blocks to perform some tasks after the last record has been read. 

> Counting the number of non-empty lines

awk '/./ { COUNT+=1 } END { print COUNT }' file

Here I used the COUNT variable and incremented it (+=1) for each line matching the regular expression /./. That is each line containing at least one character.

> Header Footer
$ awk 'BEGIN {print "The File Contents:"}

{print $0}

END {print "File footer"}' myfile

>Identifying duplicate lines using AWK
Arrays, just like other AWK variables, can be used both in action blocks as well as in patterns. By taking benefit of that, we can write a one-liner to print only duplicate lines:

awk 'a[$0]++' file

>Removing duplicate lines
As a corollary of the previous one-liner, we may want to remove duplicate lines:

awk '!a[$0]++' file
> Removing multiple spaces
awk '$1=$1' file


>  Producing tabular results
awk '+$1 { printf("%-10s | %04d\n",  $3, $1) }' FS=, file

> Find the First and Last occurance of error in log file

awk '/error/ { if (first == "") { first = $0 } last = $0 } END { print "First occurrence:", first; print "Last occurrence:", last }' logfile.log

>  give the number of occurrence of error pattern in log file using awk
awk '/error/ { count++ } END { print "Number of occurrences:", count }' logfile.log

> Conditional processing:
awk '$3 > 50 { print $0 }' file.log
//This command filters and prints lines from a log file where the value in the third field is greater than 50.

>






