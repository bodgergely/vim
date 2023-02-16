#pragma once

#include "utils-string.h"

#include <cstdint>
#include <string>
#include <vector>
#include <utility>

using u8 = uint8_t;

struct pair_hash
{
    template <class T1, class T2>
    std::size_t operator () (std::pair<T1, T2> const &pair) const
    {
        std::size_t h1 = std::hash<T1>()(pair.first);
        std::size_t h2 = std::hash<T2>()(pair.second);

        return h1 ^ h2;
    }
};

template<typename TChar>
auto tout() -> std::basic_iostream<TChar>; 

template<typename TChar, std::enable_if_t<std::is_same<TChar, char>::value>> 
auto tout() -> std::basic_iostream<TChar> {
  return std::cout;
}

template<typename TChar, std::enable_if_t<std::is_same<TChar, wchar_t>::value>> 
auto tout() -> std::basic_iostream<TChar> {
  return std::wcout;
}

template<typename TChar>
auto log(const std::basic_string<TChar>& str) {
  tout<TChar>() << str << std::endl;
}

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

