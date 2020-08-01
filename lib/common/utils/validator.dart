class Validator{
  static bool isEmail(String input) {
    String regexEmail = r"\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$";
    return RegExp(regexEmail).hasMatch(input);
  }
  static bool checkStringLength(String input, int length) {
    if (input == null || input.isEmpty) return false;
    return input.length > length;
  }
}