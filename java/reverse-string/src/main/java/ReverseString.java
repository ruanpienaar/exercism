class ReverseString {  
    String reverse(String stringToReverse) {
        String returnString = "";
        for(int i = stringToReverse.length(); i > 0; i--){
            returnString += stringToReverse.charAt(i);
        }
        return returnString;
    }
  
}