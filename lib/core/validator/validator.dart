class FieldValidator {
  String? validateEmail(String email) {
    if (email == null || email.isEmpty) {
      return "Please Enter Email";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }

  String? validatePassword(String password) {
    RegExp hasUpper = RegExp(r'[A-Z]');
    RegExp hasLower = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');

    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return "Passwords must have at least 8 characters";
    }
    if (!hasUpper.hasMatch(password)) {
      return "Passwords must have at least one uppercase character";
    }
    if (!hasLower.hasMatch(password)) {
      return "Passwords must have at least one lowercase character";
    }
    if (!hasDigit.hasMatch(password)) {
      return "Passwords must have at least one number";
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return "Enter Phone Number";
    }
    if (phoneNumber.length >= 9 && phoneNumber.length < 11) {
      return null;
    }
    return "Enter A Valid Phone Number";
  }

  String? validateUserName(String fullName) {
    if (fullName.isEmpty) {
      return "Enter A User Name";
    }
    if (fullName.length < 3) {
      return "Enter A Valid User Name";
    }
    return null;
  }
}
