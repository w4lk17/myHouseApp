import 'package:intl/intl.dart';

class TFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Customize the date format as needed
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(amount); // Customize the currency locale and symbol as needed
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Assuming a 10-digit US phone number format: (123) 456-7890

    // Implement the code for the TODO comment
    if (phoneNumber.length == 8) {
      return '${phoneNumber.substring(0, 2)} ${phoneNumber.substring(2, 4)} ${phoneNumber.substring(4, 6)} ${phoneNumber.substring(6)}';
    }
    if (phoneNumber.length == 9) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    // Add more custom phone number formatting logic for different formats if needed.
    return phoneNumber;
  }

  // Not fully tested.
  static String internationalFormatPhoneNumberUSA(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 2)}';
    digitsOnly = digitsOnly.substring(2);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      int groupLength = 2;
      if (i == 0 && countryCode == '+1') {
        groupLength = 3;
      }

      int end = i + groupLength;
      formattedNumber.write(digitsOnly.substring(i, end));

      if (end < digitsOnly.length) {
        formattedNumber.write(' ');
      }
      i = end;
    }

    return formattedNumber.toString();
  }

/// Assuming a 8 and 10-digit phone number format: +228 12 34 56 78 or +225 12 34 56 78 90
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 3)}';
    digitsOnly = digitsOnly.substring(3);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();

    if (digitsOnly.length == 8) {
      formattedNumber.write('$countryCode ');
      formattedNumber.write(digitsOnly.substring(0, 2));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(2, 4));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(4, 6));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(6, 8));
    } else if (digitsOnly.length == 10) {
      formattedNumber.write('$countryCode ');
      formattedNumber.write(digitsOnly.substring(0, 2));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(2, 4));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(4, 6));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(6, 8));
      formattedNumber.write(' ');
      formattedNumber.write(digitsOnly.substring(8, 10));
    } else {
      // Handle the case where the phone number is not 8 or 10 digits
      // You can return an error message or handle it in a different way
      return 'Invalid phone number';
    }

    return formattedNumber.toString();
  }

/// Assuming a 8 and 10-digit phone number format with dashes: (+228) 12-345-678 or (+225) 12-345-678-90
  static String internationalFormatPhoneNumberWithDashes(String phoneNumber) {
    // Remove any non-digit characters from the phone number
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');

    // Extract the country code from the digitsOnly
    String countryCode = '+${digitsOnly.substring(0, 3)}';
    digitsOnly = digitsOnly.substring(3);

    // Add the remaining digits with proper formatting
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCode) ');

    int i = 0;
    while (i < digitsOnly.length) {
      if (i == 2 || i == 5 || i == 8) {
        formattedNumber.write('-');
      }
      formattedNumber.write(digitsOnly[i]);
      i++;
    }

    return formattedNumber.toString();
  }
}

/*
*
*
* */
