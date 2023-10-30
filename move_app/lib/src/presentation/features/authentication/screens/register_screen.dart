import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_app/lib.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(title: "Registrarse"),
            Container(
                padding: const EdgeInsets.all(20),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginTextField(
                        label: "Nombre completo",
                        icon: Icons.person,
                        keyboardType: TextInputType.name,
                        onChanged: controller.setName,
                        errors: controller.errors('name'),
                      ),
                      LoginTextField(
                        label: "Correo electronico",
                        icon: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: controller.setEmail,
                        errors: controller.errors('email'),
                      ),
                      LoginTextField(
                        label: "Contraseña",
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        onChanged: controller.setPassword,
                        errors: controller.errors('password'),
                      ),
                      LoginTextField(
                        label: "Confirmar contraseña",
                        icon: Icons.lock,
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        onChanged: controller.setConfirmPassword,
                        errors: controller.errors('password_confirmation'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppRoundedButton(
                          padding: EdgeInsets.zero,
                          label: 'Registrarse',
                          onTap: controller.submit,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Center(
          child: TextButton(
            onPressed: () {
              controller.goToLogin();
            },
            child: const Text('¿Ya tiene una cuenta? Iniciar sesión'),
          ),
        ),
      ),
    );
  }
}
