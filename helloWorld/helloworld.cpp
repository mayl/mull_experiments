bool valid_age(int age) {
    if (age >= 21) {
        return true;
    }
    return false;
}

int main() {
    int test1 = valid_age(25) == true;
    if(!test1) {
        return 1;
    }

    int test2 = valid_age(20) == false;
    if(!test2) {
        return 1;
    }

    int test3 = valid_age(21) == true;
    if(!test3) {
        return 1;
    }

    return 0;
}
