import 'package:flutter/material.dart';
import 'package:quiz_1/item.dart';
import 'package:quiz_1/items.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _listItem = [
    Items(
      id: 1, 
      nama: 'Bakso', 
      deskripsi: 'Ini adalah bakso', 
      harga: 10000 , 
      jumlah: 1, 
      image: 'images/bakso.jpg'
    ),
    Items(
      id: 2, 
      nama: 'Mie ayam', 
      deskripsi: 'Ini adalah mie ayam', 
      harga: 12000 , 
      jumlah: 2, 
      image: 'images/mieayam.jpg'
    ),
    Items(
      id: 3, 
      nama: 'Nasi Goreng', 
      deskripsi: 'Ini adalah nasi goreng', 
      harga: 20000 , 
      jumlah: 1, 
      image: 'images/nasigoreng.jpeg'
    ),
    Items(
      id: 4, 
      nama: 'Mie Ayam Bakso', 
      deskripsi: 'Ini adalah mie ayam bakso', 
      harga: 15000 , 
      jumlah: 3, 
      image: 'images/bakso.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    int total = 0;
    for (var i = 0; i < _listItem.length; i++) {
      total += _listItem[i].harga * _listItem[i].jumlah;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pesanan Makanan'),
        centerTitle: true,
        backgroundColor: Colors.green[400],

      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.lightGreen[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'TOTAL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Rp. $total',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: _listItem
          .map((item) => InkWell(
            onTap: () async {
                var result = await Navigator.of(context).pushNamed('/detail',
                arguments: {'item': item,});
                _handleNavResult(result, item);
              },
              child: CardItem(Items(
                  id: item.id, 
                  nama: item.nama, 
                  deskripsi: item.deskripsi,
                  harga: item.harga, 
                  jumlah: item.jumlah,
                  image: item.image)
              ),
          
          ))
          .toList()),
      
      );
    
  }
  void _handleNavResult(Object? result, Items item) {
  if (result != null) {
    var resultMap = result as Map<String, Object>;
    if (resultMap.containsKey('jumlah')) {
      var jumlah = resultMap['jumlah'];
      if (jumlah is int) {
        int _jumlah = jumlah;
        var index = _listItem.indexOf(item);
        if (index >= 0) {
          setState(() {
            _listItem[index] = Items(
              id: item.id,
              nama: item.nama,
              harga: item.harga,
              jumlah: _jumlah,
              deskripsi: item.deskripsi,
              image: item.image
            );
          });
        }
      }
    }
  }
}
}
