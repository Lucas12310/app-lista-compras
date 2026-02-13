import 'package:flutter/material.dart';

class telaVazia extends StatelessWidget {
  const telaVazia({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // centro vertical
        crossAxisAlignment: CrossAxisAlignment.center, // centro horizontal
        children: [
          Image.asset(
            key: Key("emptyListImage"),
            "assets/images/lista-de-compras.png",
            width: 100,
            height: 100,
          ),
          const SizedBox(height: 32),
          const Text("Crie sua primeira lista", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 6),
          const Text("Toque no botão azul", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
