class AppValidator {
  static String? validatorForTitle(String? text) {
    if (text == null || text.isEmpty) {
      return 'Будь ласка, введіть назву книги';
    }
    return null;
  }

  static String? validatorForAuthor(String? text) {
    if (text == null || text.isEmpty) {
      return 'Будь ласка, введіть автора книги';
    }
    return null;
  }

  static String? validatorForPublisher(String? text) {
    if (text == null || text.isEmpty) {
      return 'Будь ласка, введіть видавництво книги';
    }
    return null;
  }
}
