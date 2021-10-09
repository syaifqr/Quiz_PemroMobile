import 'package:flutter/material.dart';
import 'package:quiz_1/items.dart';


class CardItem extends StatelessWidget {
  final Items item;
  CardItem(this.item);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      elevation: 10,
      color: Colors.green[300],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              item.image,
              width: 140,
              height: 130,
              fit: BoxFit.cover,),
            SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10,),
                      Text('Harga : Rp. ${item.harga} ', style: TextStyle(fontSize: 16),),
                    SizedBox(height: 5,),
                      Text('Jumlah : ${item.jumlah}', style: TextStyle(fontSize: 16),),
                    SizedBox(height: 5,),            
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 100,
                      color: Colors.green[700],
                      child: Text(
                        'Details',
                        style: TextStyle(color: Colors.white),
                        
                      ),
                    ),
                  ],
                ),
              ),
            ),
                          
          ],
        
        ),
      ),
    );
  }
  
}
