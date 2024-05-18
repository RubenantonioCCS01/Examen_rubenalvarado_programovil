import 'package:flutter/material.dart';
import 'package:exman_ruben_alvarado_62111565/models/data_model.dart';
import 'package:exman_ruben_alvarado_62111565/services/data_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<DataModel>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = DataService().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: FutureBuilder<List<DataModel>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListTile(
                  title: Text(item.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Year: ${item.year}'),
                      Text('Publisher: ${item.publisher}'),
                      Text('ISBN: ${item.isbn}'),
                      Text('Pages: ${item.pages}'),
                      Text('Created At: ${item.createdAt}'),
                      Text('Notes: ${item.notes.join(', ')}'),
                      Text('Villains: ${item.villains.join(', ')}'),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
