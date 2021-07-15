class CustomValidators {
  static String? required(String? value, String label) {
    value = value ?? "";
    if (value.trim() == "") return "$label is required";
    return null;
  }

  static String? length(String? value, String label, int length) {
    value = value ?? "";
    if (value.trim().length < 2)
      return "$label length must greater than $length";
    return null;
  }

  static String? email(String? value, String label) {
    value = value ?? "";
    var pattern = RegExp(r"[a-zA-Z0-9\.]{2,16}@[a-z]{2,6}(\.[a-z]{2,6}){1,3}");
    if (!pattern.hasMatch(value)) return "$label is invalid";
    return null;
  }

  static String? password(String? value, String label) {
    value = value ?? "";
    var pattern = RegExp(r"[a-zA-Z0-9\W]{4,}");
    if (!pattern.hasMatch(value)) return "$label is invalid";
    return null;
  }

  static String? mulValidator(List<Function> list) {
    for (int i = 0; i < list.length; i++) {
      String? errorString = list[i]();
      if (errorString != null) return errorString;
    }
    return null;
  }
}
