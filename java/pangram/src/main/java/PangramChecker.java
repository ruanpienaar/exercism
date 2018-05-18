/**
 * A pangram (Greek: παν γράμμα, pan gramma, "every letter") is a sentence using every letter of the alphabet at least once.
 * The best known English pangram is:
 * The quick brown fox jumps over the lazy dog.
 * @author ruanpienaar
 * @version 0.1
 */

public class PangramChecker {

    /**
     *
     * @param input String
     * @return boolean
     * 97 = a, 122 = z
     */
    public boolean isPangram(String input) {
        // if input smaller than the alphabet ?
        if(input.length() < 26) {
            return false;
        } else {
            String pangranTestStr = "";
            for (int i = 0; i < input.length(); i++) {
                char lowerCaseChar = String.valueOf(input.charAt(i)).toLowerCase().charAt(0);
                int charIntVal = (int) lowerCaseChar;
                if(charIntVal >= 97 && charIntVal <= 122){ // if a-z
                    if(! pangranTestStr.contains(String.valueOf(lowerCaseChar))){ // if known
                        pangranTestStr = pangranTestStr.concat(String.valueOf(lowerCaseChar));
                    }
                }
            }
            return pangranTestStr.length() == 26;
        }
    }

}
