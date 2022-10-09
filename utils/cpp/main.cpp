#include "utils.h"
#include "utils-string.h"
#include <string>
#include <iostream>

using namespace std;

int main(int argc, char const *argv[])
{
    string name = "test file name";
    cout << split(name) << endl;
    string name1 = "test,file,name";
    cout << split(name1, ',') << endl;

    return 0;
}
