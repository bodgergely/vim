#include <cstdint>
#include <string>
#include <vector>

using u8 = uint8_t;

std::string bin(void* data, int byteCount)
{
    std::string res{""};
    u8* c = (u8*)data;
    for (int i = 0; i < byteCount; i++) {
        u8 byte = *(c + i);
        for (int j = 0; j < 8; j++) {
            if ((byte << j) & 0x80) {
                res.push_back('1');
            }
            else {
                res.push_back('0');
            }
        }
        res.push_back(' ');
    }
    res.pop_back();
    return res;
}

