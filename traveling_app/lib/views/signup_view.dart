import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_button.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final AuthController _auth = AuthController();
  String? message;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/logo.png", height: 40),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _auth.usernameController,
                decoration: const InputDecoration(
                  labelText: "اسم المستخدم",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
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
              if (message != null)
                Text(
                  message!,
                  style: TextStyle(
                    color: message!.contains("✅") ? Colors.green : Colors.red,
                  ),
                ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : CustomButton(
                      text: "تسجيل",
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                          message = null;
                        });

                        final username = _auth.usernameController.text.trim();
                        final email = _auth.emailController.text.trim();
                        final password = _auth.passwordController.text.trim();

                        bool success = await _auth.signup(username, email, password);

                        setState(() {
                          isLoading = false;
                          message = success
                              ? "تم إنشاء الحساب بنجاح ✅"
                              : "حدث خطأ أثناء التسجيل ❌ تحقق من البيانات أو الاتصال";
                        });
                      },
                    ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginView()),
                  );
                },
                child: const Text("لديك حساب؟ تسجيل الدخول"),
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
