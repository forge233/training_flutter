class CheckValue {
  static String? validatorForValue(String? value) {
    final valueValid = RegExp(r'^[^0-9]');
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (valueValid.hasMatch(value)) {
      return 'Только числа';
    }
    return null;
  }
}
