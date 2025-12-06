import 'dart:io';
import 'package:path_provider/path_provider.dart';

class AuthService {
  static Future<File> _getFile() async {
    final dir = await getApplicationSupportDirectory();
    final file = File('${dir.path}/sign_file.txt');
    if (!await file.exists()) {
      await file.create();
    }
    return file;
  }

  /// دالة الحفظ save()
  static Future<void> save(
    String username,
    String password,
    String department,
  ) async {
    final file = await _getFile();
    final content =
        "username_$username, password_$password, department_$department\n";
    await file.writeAsString(content, mode: FileMode.append);
  }

  /// دالة الفحص checkValue()
  static Future<bool> checkValue(String username, String password) async {
    final file = await _getFile();
    final lines = await file.readAsLines();

    for (var line in lines) {
      if (line.contains("username_$username") &&
          line.contains("password_$password")) {
        return true;
      }
    }
    return false;
  }

  /// تغيير كلمة المرور
  static Future<bool> resetPassword(
    String username,
    String oldPass,
    String newPass,
  ) async {
    final file = await _getFile();
    final lines = await file.readAsLines();

    bool changed = false;
    List<String> updated = [];

    for (var line in lines) {
      if (line.contains("username_$username") &&
          line.contains("password_$oldPass")) {
        // استخراج التخصص
        final dep = line.split("department_")[1];
        updated.add("username_$username, password_$newPass, department_$dep");
        changed = true;
      } else {
        updated.add(line);
      }
    }

    if (changed) {
      await file.writeAsString(updated.join('\n'));
    }

    return changed;
  }
}
