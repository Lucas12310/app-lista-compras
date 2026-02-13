import 'package:app_lista_compras/model/Item.dart';
import 'package:flutter/material.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final nameController = TextEditingController();
  final precoController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  var showDescription = false;

  AddItem() {
    if (!formKey.currentState!.validate()) return;

    final item = Item(
      nome: nameController.text,
      preco: double.parse(precoController.text),
    );
    Navigator.of(context).pop(item);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        top: 10,
        right: 20,
        left: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Form(
        key: formKey,
        child: Column(
          //altura do modal definida pela quantidade de filhos
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Adicionar Item",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            Divider(thickness: 2, height: 0),
            SizedBox(height: 15),
            TextFormField(
              key: Key("inputItem"),
              controller: nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nome do item",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo Obrigatório";
                }
                return null;
              },
            ),
            TextFormField(
              key: Key("inputValue"),
              controller: precoController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "R\$ 0,00",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Campo Obrigatório";
                }
                return null;
              },
            ),
            Align(
              key: Key("addNewItemBtn"),
              alignment: AlignmentGeometry.centerRight,
              child: TextButton(
                key: Key("addItemBtn"),
                onPressed: AddItem,
                child: Text("Adicionar", style: TextStyle(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
