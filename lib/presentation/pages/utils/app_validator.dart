class AppValidator {
  static String? validatorForNickName(String? text) {
    final validNickname = RegExp(r'^[^A-z]');
    if (text == null || text.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (validNickname.hasMatch(text)) {
      return 'С заглавном буквы латиницой';
    } else if (text.length < 4) {
      return 'Не менее 4х символов';
    }
    return null;
  }

  static String? validatorForFirstName(String? text) {
    final validName = RegExp(r'^[^А-Яа-яЁё]');
    if (text == null || text.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (validName.hasMatch(text)) {
      return 'Только кирилица';
    } else if (text.length < 4) {
      return 'Не менее 4х символов';
    }
    return null;
  }

  static String? validatorForLastName(String? text) {
    final validLastname = RegExp(r'^[^А-Яа-яЁё]');
    if (text == null || text.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (validLastname.hasMatch(text)) {
      return 'Только кирилица';
    } else if (text.length < 4) {
      return 'Не менее 4х символов';
    }
    return null;
  }

  static String? validatorForAge(String? value) {
    final ageValid = RegExp(r'^[^0-9]');
    if (value == null || value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (ageValid.hasMatch(value)) {
      return 'Только числа';
    } else if (value.length < 2) {
      return 'Не более 2х символов';
    }
    return null;
  }

  static String? validatorForPassword(String? text) {
    final passValid = RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$');
    if (text == null || text.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (text.length < 8) {
      return 'Пароль должен быть не менее 8 символов';
    } else if (!passValid.hasMatch(text)) {
      return 'Пример пароля P@ssword13!';
    }
    return null;
  }
}
