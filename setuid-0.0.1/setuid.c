#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>

int main(void) {
    int ruid = getuid();
    int euid = geteuid();
    printf("ruid: %d euid: %d\n", ruid, euid);
    printf("setuid(0)\n");
    setuid(0);
    perror("error");
    ruid = getuid();
    euid = geteuid();
    printf("ruid: %d euid: %d\n", ruid, euid);
    return 0;
}
