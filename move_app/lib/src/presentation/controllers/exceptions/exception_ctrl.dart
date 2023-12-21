import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:move_app/lib.dart';

class ExceptionCtrl extends GetxController {
  void onDebugException(Object exception, StackTrace stackTrace) {
    log("=========================== EXCEPTION ===========================");
    log(exception.toString(), stackTrace: stackTrace);
  }

  void exception(Object exception) {
    switch (exception.runtimeType) {
      case FirebaseAuthException:
        _firebaseException(exception as FirebaseException);
        break;
      case FirebaseException:
        _firebaseException(exception as FirebaseException);
        break;
      case DioException:
        _dioException(exception as DioException);
        break;
      case ExceptionMessage:
        showSnackbar(
          "Ups! Algo salió mal 😢",
          exception.toString(),
        );
        break;
      default:
        _defaultException(exception);
        break;
    }
  }

  _firebaseException(FirebaseException exception) {
    return showSnackbar(
      "Ups! Algo salió mal 😢",
      firebaseExceptionsCodeMap[exception.code] ??
          'Se produjo un error desconocido',
    );
  }

  _dioException(DioException exception) {
    return printError(
      info: dioExceptionsCodeMap[exception.response?.statusCode ?? 0] ??
          'Se produjo un error desconocido',
    );
  }

  _defaultException(Object exception) {
    return printError(
      info: exception.toString(),
    );
  }
}

Map<int, String> dioExceptionsCodeMap = {
  400: 'Falló la solicitud debido a un error del cliente',
  401: 'Acción no autorizada',
  403: 'Acceso denegado',
  404: 'No se encontró el recurso solicitado',
  409: 'Conflicto en la solicitud',
  408: 'Tiempo de espera de la solicitud',
  500: 'Error interno del servidor',
  503: 'Servicio no disponible',
  505: 'Versión HTTP no soportada',
};

Map<String, String> firebaseExceptionsCodeMap = {
  'unknown': 'Se produjo un error desconocido',
  'user-not-found':
      'No se encontró ningún usuario correspondiente a las credenciales proporcionadas',
  'wrong-password':
      'La contraseña no es válida o el usuario no tiene contraseña',
  'weak-password': 'La contraseña debe tener al menos 6 caracteres',
  'email-already-in-use':
      'Ya existe una cuenta con la dirección de correo electrónico proporcionada',
  'invalid-email': 'La dirección de correo electrónico no es válida',
  'operation-not-allowed':
      'El tipo de cuenta correspondiente no admite esta operación',
  'account-exists-with-different-credential':
      'Ya existe una cuenta con la misma dirección de correo electrónico pero diferentes credenciales de inicio de sesión',
  'requires-recent-login':
      'El último tiempo de inicio de sesión es demasiado antiguo',
  'expired-action-code': 'El código de operación ha expirado',
  'invalid-action-code': 'El código de operación no es válido',
  'user-disabled': 'El usuario correspondiente ha sido deshabilitado',
  'user-token-expired': 'El token del usuario ya no es válido',
  'invalid-verification-code': 'El código de verificación no es válido',
  'invalid-verification-id': 'El ID de verificación no es válido',
  'invalid-phone-number': 'El número de teléfono no es válido',
  'too-many-requests':
      'Se bloqueó la solicitud debido a una actividad inusual. Inténtalo de nuevo después de un tiempo',
  'ERROR_ABORTED_BY_USER': 'Acción cancelada por el usuario',
};
