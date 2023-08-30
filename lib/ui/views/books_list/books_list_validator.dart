class BooksListValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Search term is a required field and cannot be empty.';
    }

    if (value.length < 4) {
      return 'Search term must be at least 4 characters long.';
    }

    return null;
  }
}
