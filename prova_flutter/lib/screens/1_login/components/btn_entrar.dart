import 'package:flutter/material.dart';
import 'package:prova_flutter/screens/1_login/components/funct_loading.dart';

class BtnEntrar extends StatefulWidget {
  const BtnEntrar({
    super.key,
    required this.usuarioControl,
    required this.senhaControl,
    required this.formKey,
  });

  final TextEditingController usuarioControl;
  final TextEditingController senhaControl;
  final GlobalKey<FormState> formKey;

  @override
  State<BtnEntrar> createState() => _BtnEntrarState();
}

class _BtnEntrarState extends State<BtnEntrar> {
  late bool isLoading;

  @override
  void initState() {
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: isLoading
          ? buildProgressIndicator()
          : ElevatedButton(
              onPressed: () async {
                setState(() => isLoading = true);

                await loading(widget.usuarioControl, widget.senhaControl,
                    widget.formKey, context);

                setState(() => isLoading = false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff44BD6E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 32,
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
    );
  }

  Row buildProgressIndicator() {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 40,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 4,
          ),
        )
      ],
    );
  }
}
