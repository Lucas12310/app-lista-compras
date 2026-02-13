import 'package:app_lista_compras/model/Item.dart';
import 'package:app_lista_compras/model/ListaCompra.dart';
import 'package:app_lista_compras/widgets/add_item.widget.dart';
import 'package:flutter/material.dart';

class DatailList extends StatefulWidget {
  final ListaCompra lista;

  const DatailList({super.key, required this.lista});

  @override
  State<DatailList> createState() => _DatailListState();
}

class _DatailListState extends State<DatailList> {
  double getTotalNaoMarcados() {
    double total = 0;

    for (var item in widget.lista.itens) {
      if (!item.comprado) {
        total += item.preco;
      }
    }

    return total;
  }

  double getTotalMarcados() {
    double total = 0;

    for (var item in widget.lista.itens) {
      if (item.comprado) {
        total += item.preco;
      }
    }

    return total;
  }

  void addItem() async {
    final newItem = await showModalBottomSheet<Item>(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => const AddItem(),
    );
    if (newItem != null) {
      setState(() {
        widget.lista.itens.add(newItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // desativa o voltar automático
        backgroundColor: Colors.green,
        // Botão de voltar (setinha branca)
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const SizedBox(),
        actions: [
          TextButton(
            key: Key("updateListBtn"),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              "Atualizar",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.lista.nome}",
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Divider(color: Colors.black),
            if (widget.lista.itens.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.lista.itens.length,
                itemBuilder: (context, index) {
                  final item = widget.lista.itens[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1),
                    child: Row(
                      children: [
                        // Checkbox redondo maior
                        Transform.scale(
                          scale: 1.3, // aumenta o tamanho
                          child: Checkbox(
                            key: Key("productCheckbox"),
                            shape: const CircleBorder(),
                            value: item.comprado,
                            activeColor: Colors.green,
                            onChanged: (value) {
                              setState(() {
                                item.comprado = value!;
                              });
                            },
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Nome ocupa espaço central
                        Expanded(
                          child: Text(
                            item.nome,
                            style: TextStyle(
                              fontSize: 18,
                              color: item.comprado ? Colors.grey : Colors.black,
                            ),
                          ),
                        ),

                        // Preço alinhado à direita
                        Text(
                          "R\$ ${item.preco.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

            SizedBox(height: 32),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Não marcados", style: TextStyle(fontSize: 20)),
                    Text(
                      "R\$ ${getTotalNaoMarcados().toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Marcados", style: TextStyle(fontSize: 20)),
                    Text(
                      "R\$ ${getTotalMarcados().toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addItem,
        label: Text("Adicionar", style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32), // controla a curvatura
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
