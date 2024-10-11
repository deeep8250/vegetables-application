import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Expandable Containers with Cart Toggle")),
        body: ExpandableContainerList(),
      ),
    );
  }
}

class ExpandableContainerList extends StatefulWidget {
  @override
  _ExpandableContainerListState createState() => _ExpandableContainerListState();
}

class _ExpandableContainerListState extends State<ExpandableContainerList> {
  List<Item> _data = generateItems(3);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _data.map<Widget>((Item item) {
        return ExpansionPanelList(
          elevation: 1,
          expandedHeaderPadding: EdgeInsets.all(0),
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              item.isExpanded = !isExpanded;
            });
          },
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Container(
                  padding: EdgeInsets.all(10),
                  color: item.color,
                  child: Text(
                    'Container ${item.index + 1}',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
              body: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[300],
                    child: Text('Inner Container for ${item.index + 1}'),
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.blueAccent,
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          item.isInCart = !item.isInCart;
                        });
                      },
                      child: Text(item.isInCart ? 'Remove from Cart' : 'Add to Cart'),
                    ),
                  )
                ],
              ),
              isExpanded: item.isExpanded,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class Item {
  Item({
    required this.index,
    required this.color,
    this.isExpanded = false,
    this.isInCart = false,
  });

  int index;
  Color color;
  bool isExpanded;
  bool isInCart;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      index: index,
      color: [Colors.red, Colors.green, Colors.yellow][index],
       );
     }
   );
 }
