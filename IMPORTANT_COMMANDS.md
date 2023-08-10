### find (Find)
Description: Search for files and directories based on various criteria.
Usage: find [path] [expression]
Example: find . -name "*.txt"

### awk (Awk)
Description: Text processing and pattern scanning language.
Usage: awk '[pattern] { action }' [file]
Example: awk '{print $1}' file.txt

### sed (Stream Editor)
Description: Text transformation and editing.
Usage: sed [options] 'command' [file]
Example: sed 's/old/new/' file.txt

### xargs (Execute Arguments)
Description: Execute commands with arguments from standard input.
Usage: xargs [options] command
Example: find . -name "*.txt" | xargs rm

### tee
Description: Read from standard input and write to standard output and files simultaneously.
Usage: command | tee [options] [file]
Example: ls | tee file.txt

### grep (Extended Usage)
Description: Search for patterns in files or input data using regular expressions.
Usage: grep [options] pattern [file_path]
Example: grep -r "keyword"

### base64
Description: Encode or decode binary data in Base64 format.
Usage: base64 [options] [file]
Example: base64 file.txt

### sort
Description: Sort lines of text in a file or input data.
Usage: sort [options] [file]
Example: sort file.txt
