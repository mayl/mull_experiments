#define PROJECT_NAME "helloWorld"

__attribute__((noinline))
int valid_age(int age) {
    if (age >= 21) {
        return true;
    }
    return false;
}

int main() {
    volatile int test1 = valid_age(25) == true;
    if(!test1) return 1;
    volatile int test2 = valid_age(20) == false;
    if(!test2) return 1;
    /* int test3 = valid_age(21) == 1; */
    /* if(!test3) return 1; */

    // success
    return 0;
}
