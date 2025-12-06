import 'package:flutter/material.dart';
import 'auth_service.dart';
import 'home_page.dart';
import 'signup_page.dart';
import 'reset_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final userC = TextEditingController();
  final passC = TextEditingController();

  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign In")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userC,
              decoration: const InputDecoration(labelText: "اسم المستخدم"),
            ),
            TextField(
              controller: passC,
              decoration: const InputDecoration(labelText: "كلمة المرور"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool found = await AuthService.checkValue(
                  userC.text.trim(),
                  passC.text.trim(),
                );

                if (found) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(username: userC.text),
                    ),
                  );
                } else {
                  setState(() => msg = "المستخدم غير موجود");
                }
              },
              child: const Text("تسجيل الدخول"),
            ),
            Text(msg, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SignUpPage()),
                );
              },
              child: const Text("إنشاء حساب جديد"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ResetPage()),
                );
              },
              child: const Text("إعادة تعيين كلمة المرور"),
            ),
          ],
        ),
      ),
    );
  }
}
