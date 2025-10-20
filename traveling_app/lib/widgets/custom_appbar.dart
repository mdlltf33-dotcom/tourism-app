import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFFC94A), Color(0xFF00C2FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ✅ زر القائمة يفتح الدروار تلقائيًا
              Builder(
                builder: (context) => IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                ),
              ),

              // ✅ اسم التطبيق + الشعار
              Row(
                children: [
                  const Text(
                    "SyrTrip",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset('assets/logo.png', height: 55, width: 55),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
