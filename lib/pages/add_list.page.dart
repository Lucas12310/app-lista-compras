import 'package:flutter/material.dart';

class AddList extends StatefulWidget {
  const AddList({super.key});

  @override
  State<AddList> createState() => _AddListState();
}

class _AddListState extends State<AddList> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centro vertical
          crossAxisAlignment: CrossAxisAlignment.center, // centro horizontal
          children: [
            const Spacer(),
            TextField(
              key: Key("listNameInput"),
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Nome da lista",
                border: InputBorder.none,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                // Botão Voltar
                Expanded(
                  child: OutlinedButton(
                    key: Key("backToListsBtn"),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Colors.white,
                      ), // borda branca
                      foregroundColor: Colors.white, // texto branco
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Voltar"),
                  ),
                ),

                const SizedBox(width: 16), // espaço entre eles
                // Botão Criar
                Expanded(
                  key: Key("createListBtn"),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, // fundo branco
                      foregroundColor: Colors.blue, // texto azul
                      elevation: 0, // tira sombra (opcional)
                    ),
                    onPressed: () {
                      final nome = controller.text.trim();
                      if (nome.isEmpty) return;
                      Navigator.pop(context, nome);
                    },
                    child: const Text("Criar"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24), // margem inferior
          ],
        ),
      ),
    );
  }
}
