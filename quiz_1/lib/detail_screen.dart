import 'package:flutter/material.dart';
import 'package:quiz_1/items.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);
  

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Items? _item;
  int count = -1;

  void plus() {
    setState(() {
      count++;
    });
  }

  void minus() {
    if (count > 0) {
      setState(() {
      count--;
    });
    }
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    if (args.containsKey('item')) {
      var item = args['item'];
      if (item is Items) {
        _item = item;
        if (count < 0 ) {
          count = _item?.jumlah ?? 0;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Makanan'),
        backgroundColor: Colors.green[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                _item?.image ?? 'ERROR', 
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.40,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            height: MediaQuery.of(context).size.height * 0.2 ,
            child: Column(
              children: <Widget> [
                Text(
                    _item?.nama ?? 'ERROR',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                SizedBox(height: 10,),
                Text(_item?.deskripsi ?? 'ERROR' , style: TextStyle(fontSize: 16),),
                SizedBox(height: 5,),
                Text('Harga : Rp. ${_item?.harga ?? 'XXXXX'} ', style: TextStyle(fontSize: 16),),
                    
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: minus, 
                icon: Icon(Icons.remove_circle_outlined)
              ),
              Text('$count'),
              IconButton(
                onPressed: plus, 
                icon: Icon(Icons.add_circle_outlined)
              ),
            ],
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              fixedSize: Size(150,30),
            ),
            onPressed: () {
              Navigator.of(context).pop(
                {
                'jumlah' : count,
                }
              );
            }, 
            child: Text('SUBMIT'))
        ],
      ),
      
    );
  }
}