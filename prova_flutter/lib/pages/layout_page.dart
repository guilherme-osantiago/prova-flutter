import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LayoutPage extends StatelessWidget {
  final Widget child;
  const LayoutPage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff1F4D61), Color(0xff2D958E)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(child: child),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse('https://www.google.com.br');
                  if (!await launchUrl(url)) {
                    throw Exception('Não foi possível abrir $url');
                  }
                },
                child: const Text(
                  'Política de Privacidade',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
