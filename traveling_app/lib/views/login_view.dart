import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import 'home_view.dart';
import 'signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController _auth = AuthController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.cyanAccent,
                child: Image.asset("assets/logo.png"),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _auth.emailController,
                decoration: const InputDecoration(
                  labelText: "البريد الإلكتروني",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _auth.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "كلمة المرور",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              if (errorMessage != null)
                Text(
                  errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              CustomButton(
                text: "تسجيل الدخول",
                onPressed: () async {
                  final success = await _auth.login(
                    _auth.emailController.text,
                    _auth.passwordController.text,
                  );
                  if (success && mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const HomeView()),
                    );
                  } else {
                    setState(() => errorMessage = "بيانات غير صحيحة");
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: "تسجيل بواسطة Google",
                icon: Icons.g_mobiledata,
                color: Colors.orange,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomeView()),
                  );
                },
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupView()),
                  );
                },
                child: const Text("ليس لديك حساب؟ إنشاء حساب جديد"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _auth.dispose();
    super.dispose();
  }
}
