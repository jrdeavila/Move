class ExceptionMessage implements Exception {
  final String code;

  ExceptionMessage({
    required this.code,
  });

  static Map<String, String> exceptionMessageCodes = {
    "driver-not-available": "El conductor no está disponible",
    "password-not-match": "La contraseña no coincide",
    'points-not-enough': 'No tienes suficientes puntos para pagar el servicio',
  };

  @override
  String toString() => exceptionMessageCodes[code] ?? code;
}
