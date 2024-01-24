class ExceptionMessage implements Exception {
  final String code;

  ExceptionMessage({
    required this.code,
  });

  static Map<String, String> exceptionMessageCodes = {
    "driver-not-available": "El conductor no está disponible",
  };

  @override
  String toString() => exceptionMessageCodes[code] ?? code;
}
