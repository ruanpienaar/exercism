package strand

var conversion = map[rune]byte{
	'G': 'C',
	'C': 'G',
	'T': 'A',
	'A': 'U',
}

// 2x faster than the previous itt.
// learning by coping others :)

func ToRNA(dna string) string {
	rna := make([]byte, len(dna))
	for i, rune := range dna {
		rna[i] = conversion[rune]
	}
	return string(rna)
}