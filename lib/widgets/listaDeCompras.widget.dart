import 'package:app_lista_compras/model/ListaCompra.dart';
import 'package:app_lista_compras/pages/datail_list.page.dart';
import 'package:flutter/material.dart';

class listaDeCompras extends StatefulWidget {
  final List<ListaCompra> listas;
  const listaDeCompras({super.key, required this.listas});

  @override
  State<listaDeCompras> createState() => _listaDeComprasState();
}

class _listaDeComprasState extends State<listaDeCompras> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: Key("shoppingListCard"),
      itemCount: widget.listas.length,
      itemBuilder: (context, index) {
        final lista = widget.listas[index];

        // Conta quantos estão marcados
        final total = lista.itens.length;
        final marcados = lista.itens.where((item) => item.comprado).length;

        final progresso = total == 0 ? 0.0 : marcados / total;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          elevation: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DatailList(lista: lista),
                ),
              ).then((_) {
                setState(() {});
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              lista.nome,
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              "$marcados/$total",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        LinearProgressIndicator(
                          value: progresso,
                          minHeight: 6,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
