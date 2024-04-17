import 'package:mevo/lib.dart';

class DetailsCtrl extends GetxController {
  // -----------------------------------
  final RxString _firstName = ''.obs;
  final RxString _lastName = ''.obs;
  final RxString _phone = ''.obs;
  final RxString _email = ''.obs;
  final RxBool _isDriver = false.obs;
  final RxBool _isClient = false.obs;
  final RxBool _isAdmin = false.obs;
  final RxDouble _rating = 0.0.obs;

  // -----------------------------------
  String get firstname => _firstName.value;
  String get lastname => _lastName.value;
  String get phone => _phone.value;
  String get email => _email.value;
  bool get isDriver => _isDriver.value;
  bool get isClient => _isClient.value;
  bool get isAdmin => _isAdmin.value;
  double get rating => _rating.value;

  // -----------------------------------
  void setPhone(String text) {
    _phone.value = text;
  }

  void setLastName(String text) {
    _lastName.value = text;
  }

  void setFirstName(String text) {
    _firstName.value = text;
  }

  void setEmail(String text) {
    _email.value = text;
  }

  // -----------------------------------

  @override
  void onReady() {
    super.onReady();
    _loadProfile();
  }

  void _loadProfile() {
    _firstName.value = Get.find<SessionCtrl>().user!.firstname;
    _lastName.value = Get.find<SessionCtrl>().user!.lastname;
    _phone.value = PhoneConvert.fromFirebase(
        numberPhone: Get.find<SessionCtrl>().user!.phone);
    _email.value = Get.find<SessionCtrl>().user!.email;
    _isDriver.value = Get.find<SessionCtrl>().user!.isDriver;
    _isClient.value = Get.find<SessionCtrl>().user!.isClient;
    _isAdmin.value = Get.find<SessionCtrl>().user!.isAdmin;
    _rating.value = Get.find<SessionCtrl>().user!.rating ?? 0.0;
  }

  // -----------------------------------

  void updateProfile() async {
    var appUser = Get.find<SessionCtrl>().user!;
    final updateProfileRequest = UpdateProfileRequest(
      uuid: appUser.uuid,
      firstname: _firstName.value,
      lastname: _lastName.value,
      phone: PhoneConvert.toFirebase(numberPhone: _phone.value),
      email: _email.value,
      roles: appUser.roles,
    );

    final useCase = getIt<IUpdateProfileUseCase>();
    final result = await useCase.updateProfile(updateProfileRequest);
    Get.find<BannerCtrl>().showSuccess(
      "Operación exitosa 😄",
      'Se ha actualizado correctamente su perfil',
    );

    Get.find<SessionCtrl>().onUpdateProfileSuccess(result);
  }

  void deleteAccount() {
    Get.dialog(
      DeleteAccountDialog(),
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({
    super.key,
  });

  _showValidationDialog() {
    Get.dialog(
      ValidatePasswordDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Eliminar cuenta'),
      content: const Text(
          '¿Está seguro que desea eliminar su cuenta? Esta acción no se puede deshacer.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Get.back();
            _showValidationDialog();
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}

class ValidatePasswordDialog extends StatelessWidget {
  const ValidatePasswordDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return AlertDialog(
      title: const Text('Validación de contraseña'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
              'Por favor, ingrese su contraseña para confirmar la eliminación de su cuenta.'),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: UnderlineInputBorder(),
            ),
            obscureText: true,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            Get.find<SessionCtrl>().deleteAccount(
              password: controller.text,
            );
          },
          child: const Text('Eliminar'),
        ),
      ],
    );
  }
}
