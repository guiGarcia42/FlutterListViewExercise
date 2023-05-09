import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:listview_demo/contato.dart';

enum Favorito { sim, nao }

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  final List<Contato> items = [
    new Contato('Guilherme Garcia', 'gui123.garcia@gmail.com', false,
        'https://i.pravatar.cc/150?img=1'),
    new Contato('Camila Xavier', 'camila123.xavier@gmail.com', false,
        'https://i.pravatar.cc/150?img=2'),
    new Contato('André Codo', 'andre123.codo@gmail.com', false,
        'https://i.pravatar.cc/150?img=3'),
    new Contato('Gabriel Monteiro', 'gabriel123.monteiro@gmail.com', false,
        'https://i.pravatar.cc/150?img=4'),
    new Contato('Nathalia Schwertner', 'nathalia123.schwertner@gmail.com',
        false, 'https://i.pravatar.cc/150?img=5'),
  ];
  int countFav = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos Favoritos ' + countFav.toString()),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, int index) {
          if (items[index].nome != null) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(items[index].imagem),
              ),
              title: Text(items[index].nome),
              subtitle: Text(items[index].email),
              trailing: IconButton(
                icon: items[index].isFav == false
                    ? Icon(Icons.favorite_border)
                    : Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  setState(() {
                    if (items[index].isFav == false) {
                      items[index].isFav = true;
                      countFav++;
                    } else {
                      items[index].isFav = false;
                      countFav--;
                    }
                  });
                },
              ),
            );
          } else {
            return ListTile();
          }
        },
      ),
    );
  }
}
