import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_app/lib.dart';

class LoginScreen extends GetView<LoginCtrl> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginHeader(title: "Iniciar sesión"),
            Container(
                padding: const EdgeInsets.all(20),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Checkbox(
                            value: controller.rememberMe,
                            onChanged: controller.setRememberMe,
                          ),
                          Text(
                            'Recordar',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppRoundedButton(
                          padding: EdgeInsets.zero,
                          label: 'Entrar',
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                controller.goToRegister();
              },
              child: const Text('¿No tienes una cuenta? Registrate'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image.asset(
                  "assets/img/logo.png",
                  width: 200,
                ),
                const Spacer(),
                Image.asset(
                  "assets/img/colombia.png",
                  width: 50,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
