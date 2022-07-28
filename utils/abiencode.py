import sys
import eth_abi

# note: for efficiency, this functionality separates the input in a natural way,
#       i.e., ignoring whitespace for encoding and just taking the argv as it is

if __name__ == "__main__":
	results = []
	for p in sys.argv[1:]:
		typs, vals = eval(p)
		out = eth_abi.encode_abi(typs, vals).hex()
		print(out)