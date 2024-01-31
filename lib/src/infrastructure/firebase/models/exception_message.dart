class ExceptionMessage implements Exception {
  final String code;

  ExceptionMessage({
    required this.code,
  });

  static Map<String, String> exceptionMessageCodes = {
    "driver-not-available": "El conductor no está disponible",
    "password-not-match": "La contraseña no coincide",
  };

  @override
  String toString() => exceptionMessageCodes[code] ?? code;
}
