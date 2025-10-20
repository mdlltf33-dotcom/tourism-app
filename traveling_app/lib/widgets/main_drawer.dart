import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../controllers/auth_controller.dart';
import '../views/login_view.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  String userName = 'زائر';

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? 'زائر';
    });
  }

  Future<void> _updateUserName(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("تعديل الاسم"),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "الاسم الجديد",
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () async {
              final newName = nameController.text.trim();
              Navigator.pop(ctx);

              if (newName.length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("❌ الاسم يجب أن يحتوي على 3 أحرف على الأقل")),
                );
                return;
              }

              final prefs = await SharedPreferences.getInstance();
              final token = prefs.getString('token');

              if (token == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("❌ يجب تسجيل الدخول أولاً")),
                );
                return;
              }

              final url = Uri.parse("https://tourism-app-1-fs9e.onrender.com/api/auth/update-name");
              final res = await http.put(
                url,
                headers: {
                  'Content-Type': 'application/json',
                  'Authorization': 'Bearer $token',
                },
                body: jsonEncode({'name': newName}),
              );

              if (res.statusCode == 200) {
                await prefs.setString('user_name', newName);
                setState(() {
                  userName = newName;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("✅ تم تعديل الاسم بنجاح")),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("❌ فشل تعديل الاسم")),
                );
              }
            },
            child: const Text("حفظ"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 200,
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.lightBlue),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/yong.png'),
              ),
              accountName: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Text(userName, style: const TextStyle(fontSize: 14)),
              ),
              accountEmail: const Padding(
                padding: EdgeInsets.only(top: 4, left: 4),
                child: Text("abo.omar@example.com"),
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("تعديل الاسم"),
            onTap: () => _updateUserName(context),
          ),

          const Divider(),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("تابعنا على صفحاتنا", style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.blue),
                onPressed: () => _openLink('https://www.facebook.com/syrtrip', context),
              ),
              IconButton(
                icon: const Icon(Icons.telegram, color: Colors.blueAccent),
                onPressed: () => _openLink('https://t.me/syrtrip', context),
              ),
              IconButton(
                icon: const Icon(Icons.camera_alt, color: Colors.purple),
                onPressed: () => _openLink('https://www.instagram.com/syrtrip', context),
              ),
              IconButton(
                icon: const Icon(Icons.wallet_giftcard, color: Colors.green),
                onPressed: () => _openLink('https://wa.me/963945474861', context),
              ),
            ],
          ),

          const Divider(),

          _buildNavItem(context, Icons.language, "تغيير اللغة", '/language'),

          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text("الإبلاغ عن مشكلة فنية"),
            onTap: () => _sendEmail(context),
          ),

          const Divider(),

          _buildLogoutItem(context),
          _buildDeleteItem(context),

          const Divider(),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("إصدار التطبيق: 1.0.0", style: TextStyle(color: Colors.grey)),
          ),

          _buildNavItem(context, Icons.arrow_back, "رجوع", null),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String title, String? route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        if (route != null) Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildLogoutItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout),
      title: const Text("تسجيل الخروج"),
      onTap: () async {
        Navigator.pop(context);
        await AuthController().logout();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginView()),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تم تسجيل الخروج")),
        );
      },
    );
  }

  Widget _buildDeleteItem(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.delete_forever, color: Colors.red),
      title: const Text("حذف الحساب", style: TextStyle(color: Colors.red)),
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text("تأكيد الحذف"),
            content: const Text("هل أنت متأكد أنك تريد حذف الحساب؟ لا يمكن التراجع."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: const Text("إلغاء"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                  // TODO: تنفيذ حذف الحساب
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("تم حذف الحساب")),
                  );
                },
                child: const Text("حذف", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        );
      },
    );
  }

  void _openLink(String url, BuildContext context) async {
    final Uri uri = Uri.parse(url);
    final bool launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!launched) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView);
    }
  }

  void _sendEmail(BuildContext context) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'mdlltf33@gamil.com',
      query: Uri.encodeFull('subject=بلاغ فني&body=يرجى كتابة تفاصيل المشكلة هنا...'),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.platformDefault);
    } else {
      final Uri fallbackUri = Uri.parse('https://t.me/syrtrip');
      final bool launched = await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("تعذر فتح البريد أو الرابط البديل")),
        );
      }
    }
  }
}
