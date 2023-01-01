serial = "5B134977135E7D13"
key = (0x10, 0x20, 0x30)

def generate_internalkey(name, key):
    intkey = []
    for i, ch in enumerate(name):
        xored_str = hex(ord(ch) ^ key[i % len(key)])[2:]
        intkey = intkey + [xored_str[0], xored_str[1]]
    return intkey

def generate_name(serial, key):
    name = []
    intermed = []
    for i in range(0, len(serial), 2):
        intermed.append(int(serial[i] + serial[i+1], 16))
    for i, x in enumerate(intermed):
        name.append(chr(x ^ key[i % len(key)]))
    return "".join(name)
        


name = generate_name(serial, key)
print(name)
# print(generate_internalkey("geriket", key))











