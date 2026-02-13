import 'package:app_lista_compras/model/Item.dart';

class ListaCompra {
  String nome;
  List<Item> itens;

  ListaCompra({
    required this.nome,
    required this.itens,
  });
}
