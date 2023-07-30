class FieldValidator {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Please Enter Email";
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(email)) {
      return "Please Enter A Valid Email";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (!RegExp(r'.{8,}').hasMatch(password)) {
      return "Passwords must have at least 8 characters";
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
