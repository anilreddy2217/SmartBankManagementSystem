package com.bank.util;

import java.util.Random;

public class AccountUtil {

    private static final Random random = new Random();

    // 12-digit account number starting with 10
    public static String generateAccountNumber() {
        // Generates account number like: 10XXXXXXXXXX (12 digits total)
        long number = 1000000000L + (long)(random.nextDouble() * 9000000000L);
        return "10" + number;
    }

    // Simple temp password
    public static String generateTempPassword() {
        return "TMP" + (1000 + random.nextInt(9000));
    }
}
