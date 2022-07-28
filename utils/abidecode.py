import sys
import eth_abi

# note: for efficiency, this functionality separates the input in a natural way,
#       i.e., ignoring whitespace for encoding and just taking the argv as it is

if __name__ == "__main__":
    results = []
    for p in sys.argv[1:]:
        typs, mem = eval(p)
        out = eth_abi.decode_abi(typs, mem)
        print("<sep>".join([str(q) for q in out]))