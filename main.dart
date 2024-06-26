import 'package:flutter/material.dart';

void main() {
  runApp(ItemListApp());
}

class ItemListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ItemListScreen(),
      routes: {
        '/details': (context) => ItemDetailsScreen(),
      },
    );
  }
}

class Fruit {
  final String name;
  final String description;

  Fruit({required this.name, required this.description});
}

class ItemListScreen extends StatelessWidget {
  final List<Fruit> items = [
    Fruit(
      name: 'Apple',
      description: 'Apples are nutritious and delicious.',
    ),
    Fruit(
      name: 'Banana',
      description: 'Bananas are high in potassium and great for snacks.',
    ),
    Fruit(
      name: 'Cherry',
      description: 'Cherries are small, round, and red or black in color.',
    ),
    Fruit(
      name: 'Date',
      description: 'Dates are sweet fruits of the date palm tree.',
    ),
    Fruit(
      name: 'Elderberry',
      description:
          'Elderberries are small, dark berries that grow in clusters.',
    ),
    Fruit(
      name: 'Fig',
      description: 'Figs are soft, sweet fruits with a thin skin.',
    ),
    Fruit(
      name: 'Grape',
      description:
          'Grapes can be eaten fresh or used to make wine, juice, and jelly.',
    ),
    Fruit(
      name: 'Honeydew',
      description: 'Honeydew melons are sweet and green-fleshed.',
    ),
    Fruit(
      name: 'Iced Apple',
      description: 'Iced apples are frozen versions of regular apples.',
    ),
    Fruit(
      name: 'Jackfruit',
      description:
          'Jackfruits are large, tropical fruits with a spiky exterior.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruits List'),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Card(
              margin: EdgeInsets.all(4.0),
              child: ListTile(
                title: Text(
                  items[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/details',
                    arguments: items[index],
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('More items can be added.'),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Fruit item = ModalRoute.of(context)!.settings.arguments as Fruit;

    return Scaffold(
      appBar: AppBar(
        title: Text('${item.name} Details'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.name,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                item.description,
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
