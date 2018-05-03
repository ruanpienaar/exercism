class ArmstrongNumbers {
	boolean isArmstrongNumber(int numberToCheck) {
		String NumStr = String.valueOf(numberToCheck);
		// 153
		int total = 0;
		int l = NumStr.length();
		for( int i = 0; i < l; i++ ){
		    int check = Integer.valueOf(NumStr.charAt(i));
		    total += Math.pow(check, l);
		}
		//System.out.println("TOTAL :" + total);
		System.err.println("Value "+total);
		if( total == numberToCheck){
		    return true;
		} else {
		    return false;
		}
	}
}
