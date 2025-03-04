import 'package:my_house/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String uid;
  final String? username;
  final String email;
  final String password;
  final String? fcm;
  final String? phone;
  final bool? verification;
  final String? profilePicture;
  final String? userType;
  final String? userToken;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.uid,
    this.username,
    required this.email,
    required this.password,
    this.fcm,
    this.phone,
    this.verification,
    this.profilePicture,
     this.userType,
    this.userToken,
  });

  /// hELPER FUNCTION TO GET FULL NAME
  String get fullName => '$firstName $lastName';

  /// helper function to format phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phone!);

  /// static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// static function to generate username from the full name.
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName'; //combine first name and last name
    String usernameWithPrefix = 'cwt_$camelCaseUsername'; //add 'cwt_' prefix

    return usernameWithPrefix;
  }

  // Static function to create an empty user model.
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        uid: '',
        username: '',
        email: '',
        password: '',
        fcm: '',
        phone: '',
        verification: false,
        userType: '',
        profilePicture: '',
        userToken: '',
      );

  // Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': generateUsername(fullName),
      'email': email,
      'fcm': fcm,
      'phone': phone,
      'verification': verification,
      'profilePicture': profilePicture,
      'userType': userType,
      'userToken': userToken
    };
  }

  // Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      uid: json['uid'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      fcm: json['fcm'] ?? '',
      phone: json['phone'],
      verification: json['verification'] ?? false,
      profilePicture: json['profilePicture'] ?? '',
      userType: json['userType'] ?? '',
      userToken: json['userToken'] ?? '',
    );
  }
  // Helper method to convert a list of JSON objects to a list of User objects
  static List<UserModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => UserModel.fromJson(json)).toList();
  }
}
