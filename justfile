# Justfile for running my-c-grep

# Default recipe to run the program
@_default:
    just --choose

# Recipe to run the program after building it with make
run args:
    make
    ./my-c-grep {{ args }}

test-small:
    make
    ./my-c-grep testfiles/small "apple"

test-large:
    make
    ./my-c-grep testfiles/large "apple"

# Clean up the binary using make
clean:
    make clean

# Usage information
help:
    @echo "Available commands:"
    @echo "  just run args='path/to/dir search_string' - Build and run the program with arguments"
    @echo "  just clean     - Clean the compiled binary"
