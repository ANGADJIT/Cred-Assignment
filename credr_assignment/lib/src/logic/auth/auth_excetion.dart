class AuthException implements Exception {
  final String _errorMessage;

  AuthException(this._errorMessage);

  @override
  String toString() {
    return _errorMessage;
  }
}
