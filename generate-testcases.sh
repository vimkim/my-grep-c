#!/bin/bash

# File 1: Basic content
cat <<EOL >file_basic.txt
apple banana orange
grape pineapple mango
cherry apple berry
EOL

# File 2: Empty file
touch file_empty.txt

# File 3: Multi-line content
cat <<EOL >file_multilines.txt
This is the first line.
The second line has an apple.
And the third line is just a line.
EOL

# File 4: Unicode content
cat <<EOL >file_unicode.txt
こんにちは 世界
안녕하세요 세계
Привет мир
Hello world
EOL

# File 5: Special characters
cat <<EOL >file_special_chars.txt
This \$line contains special* characters like ^, $, *, and +.
Another line with parentheses ( ) and brackets [ ].
A line with a | pipe symbol.
EOL

# File 6: Large file
for i in {1..1000}; do
  echo "Line number $i with apple and orange" >>file_large.txt
done

# File 7: Case-sensitive content
cat <<EOL >file_case_sensitive.txt
This line has the word Apple.
Another line with apple in lowercase.
APPLE is here in uppercase.
EOL

echo "Test files generated successfully!"
