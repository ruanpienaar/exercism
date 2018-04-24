using System;

public static class ReverseString {
    public static string Reverse(string input) {
        char[] i = input.ToCharArray();
        char[] cs = new char[i.Length]; // NB! length 1 based.
        int len = i.Length - 1; // NB! Array is Zero based - length is 1 based.
        for (int a = len; a >= 0; a--){
            cs[len - a] = i[a];
        }
        return new string(cs);
    }
}