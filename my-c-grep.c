#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

#define MAX_LINE_LENGTH 1024

void search_in_file(const char *filename, const char *search_str) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open file");
        return;
    }

    char line[MAX_LINE_LENGTH];
    int line_number = 0;

    while (fgets(line, sizeof(line), file)) {

        line_number++;

        if (strstr(line, search_str)) {
            printf("%s:%d: %s", filename, line_number, line);
        }
    }

    fclose(file);
}

void search_in_directory(const char *dir_name, const char *search_str) {
    DIR *dir = opendir(dir_name);
    if (!dir) {
        perror("Failed to open directory");
        return;
    }

    struct dirent *entry;
    struct stat entry_info;
    char path[PATH_MAX];

    while ((entry = readdir(dir))) {
        // Skip "." and ".."
        if (strcmp(entry->d_name, ".") == 0 ||
            strcmp(entry->d_name, "..") == 0) {
            continue;
        }

        snprintf(path, sizeof(path), "%s/%s", dir_name, entry->d_name);

        if (stat(path, &entry_info) == -1) {
            perror("Failed to get file status");
            continue;
        }

        if (S_ISDIR(entry_info.st_mode)) {
            // Recursively search in subdirectory
            search_in_directory(path, search_str);
        } else if (S_ISREG(entry_info.st_mode)) {
            // Search in regular file
            search_in_file(path, search_str);
        }
    }

    closedir(dir);
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <directory> <search_string>\n", argv[0]);
        return EXIT_FAILURE;
    }

    const char *directory = argv[1];
    const char *search_str = argv[2];

    search_in_directory(directory, search_str);

    return EXIT_SUCCESS;
}
