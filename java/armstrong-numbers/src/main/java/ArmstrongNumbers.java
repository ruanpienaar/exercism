class ArmstrongNumbers {
    boolean isArmstrongNumber(int numberToCheck) {
        String NumStr = String.valueOf(numberToCheck);
        int total = 0;
        int l = NumStr.length();
        for( int i = 0; i < l; i++ ){
            int check = Integer.valueOf(String.valueOf(NumStr.charAt(i)));
            total += Math.pow(check, l);
            if( total > numberToCheck ){
                return false;
            }
        }
        if( total == numberToCheck ){
            return true;
        } else {
            return false;
        }
    }
}