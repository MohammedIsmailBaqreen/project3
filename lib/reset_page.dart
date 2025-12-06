import 'package:flutter/material.dart';
import 'auth_service.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({super.key});

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final userC = TextEditingController();
  final oldC = TextEditingController();
  final newC = TextEditingController();

  String msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userC,
              decoration: const InputDecoration(labelText: "اسم المستخدم"),
            ),
            TextField(
              controller: oldC,
              decoration: const InputDecoration(
                labelText: "كلمة المرور القديمة",
              ),
              obscureText: true,
            ),
            TextField(
              controller: newC,
              decoration: const InputDecoration(
                labelText: "كلمة المرور الجديدة",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool done = await AuthService.resetPassword(
                  userC.text.trim(),
                  oldC.text.trim(),
                  newC.text.trim(),
                );

                setState(
                  () => msg = done ? "تم التغيير بنجاح" : "البيانات غير صحيحة",
                );
              },
              child: const Text("تغيير كلمة المرور"),
            ),
            Text(
              msg,
              style: TextStyle(
                color: msg.contains("نجاح") ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
