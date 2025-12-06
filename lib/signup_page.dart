import 'package:flutter/material.dart';
import 'auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userC = TextEditingController();
  final passC = TextEditingController();
  final depC = TextEditingController();

  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
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
            TextField(
              controller: depC,
              decoration: const InputDecoration(labelText: "التخصص"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await AuthService.save(
                  userC.text.trim(),
                  passC.text.trim(),
                  depC.text.trim(),
                );
                setState(() => msg = "تم إنشاء الحساب بنجاح");
              },
              child: const Text("تسجيل حساب"),
            ),
            Text(msg, style: const TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
