#include <iostream>
#include <string>

#include "Include/suki.hpp"

int suki(void) {
    return 520;
}

void xihuandehua(void) {
    std::cout << "姐姐，我喜欢你！" << std::endl;
}


char cincin(void) {
    char message;
    std::cin >> message;
    return message;
}

std::string zxhl(void) {
    return "姐姐，我爱你";
}

char* morechar(void) {
    static char message[] = "姐姐，我想你";
    return message;
}

/*
std::string cincin(void) {
    std::string message;
    std::cin >> message;
    return message;
}
*/

/*
int foo(void) {
    return 0;
}
*/