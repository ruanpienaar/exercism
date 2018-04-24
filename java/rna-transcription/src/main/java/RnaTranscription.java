class RnaTranscription {

    String transcribe(String dnaStrand) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < dnaStrand.length(); i++) {
            String RNALetter = dna_to_rna( Character.toString(dnaStrand.charAt(i)) );
            sb.append( RNALetter );
        }
        return sb.toString();
    }
    
    String dna_to_rna(String letter) {
        switch (letter) {
            case "G":
                return "C";
            case "C":
                return "G";
            case "T":
                return "A";
            case "A":
                return "U";
            default:
                throw new IllegalArgumentException("Invalid input");
        }
    }
    
}
