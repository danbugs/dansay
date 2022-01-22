#include<iostream>

using std::cout;
using std::cerr;
using std::endl;

int main(int argv, char** argc)
{
    if ( argv > 1) {
        for (int i = 1; i < argv; ++i)
            cout << argc[i] << endl;
    } else {
        cerr << "Usage: dansay [sentences]" << endl;
    }
    return 0;
}