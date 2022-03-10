import sys
import sha3

# note: for efficiency, this functionality separates the input in a natural way,
#       i.e., ignoring whitespace for encoding and just taking the argv as it is
# note: for function names such as "addition(uint256,uint256)", since they contain
#       special tokens like ",", you should quote the arguments so they will be treated
#       as string

if __name__ == "__main__":
	results = []
	for p in sys.argv[1:]:
		k = sha3.keccak_256()
		k.update(str.encode(p))
		results.append(k.hexdigest())
	for q in results:
		print(q)