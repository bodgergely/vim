import sys
import getopt


def run():
    try:
        # Short option syntax: "hv:"
        # Long option syntax: "help" or "verbose="
        opts, args = getopt.getopt(sys.argv[1:], "k:o:i:", ["input=", "output=", "keyword="])

    except Exception as ex:
        # Print debug info
        print(ex)
        print("Exception in run()")
        exit(1)

    print(opts)

    input = None
    output = None
    keyword = None
    for option, argument in opts:
        if option in ("-h", "--help"):
            print("-k <keyword> -i <inputfile> -o <outputfile>") 
        elif option in ("-i", "--input"):
            input = argument
        elif option in ("-o", "--output"):
            output = argument
        elif option in ("-k", "--keyword"):
            keyword = argument
    if input == None or output == None or keyword == None:
        print("Keyword or Input or output arg is missing")
        exit(1)
    xor_encr(keyword, input, output)
       

def xor(input, key):
    ba = bytearray()
    for i in range(len(input)):
        v = input[i] ^ ord(key[i%len(key)])
        ba+=bytes([v]) 
    return ba

def xor_encr(keyword, inputf, outputf):
    with open(inputf, 'rb') as infile:
        with open(outputf, 'wb') as outfile:
            inc = infile.read()
            enc = xor(inc, keyword)
            outfile.write(enc)



if __name__ == "__main__":
    run()
