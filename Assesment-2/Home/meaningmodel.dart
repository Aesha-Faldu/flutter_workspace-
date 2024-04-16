import 'package:babyname/Home/rashi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BabyName extends StatefulWidget {
  final List list;

  BabyName({required this.list});

  @override
  _BabyNameState createState() => _BabyNameState();
}

class _BabyNameState extends State<BabyName> {
  late List filteredList;
  String selectedGender = 'All';
  String selectedReligion = 'Religion';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredList = widget.list;
  }

  void filterList(String gender, String religion) {
    setState(() {
      selectedGender = gender;
      selectedReligion = religion;
      if (gender == 'All' && religion == 'religion') {
        filteredList = widget.list;
      } else if (gender == 'All' && religion != 'religion') {
        filteredList = widget.list.where((name) => name['religion'] == religion).toList();
      } else if (gender != 'All' && religion == 'religion') {
        filteredList = widget.list.where((name) => name['gender'] == gender.toLowerCase()).toList();
      } else {
        filteredList = widget.list.where((name) => name['gender'] == gender.toLowerCase() && name['religion'] == religion).toList();
      }
    });
  }

  void searchList(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredList = widget.list;
      } else {
        filteredList = widget.list.where((name) => name['name'].toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total: ${filteredList.length}', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
        actions: [
          DropdownButton<String>(
            value: selectedGender,
            onChanged: (String? newValue) {
              if (newValue != null) {
                filterList(newValue, selectedReligion);
              }
            },
            items: <String>['All', 'Boy', 'Girl']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: selectedReligion,
            onChanged: (String? newValue) {
              if (newValue != null) {
                filterList(selectedGender, newValue);
              }
            },
            items: <String>['Religion', 'hihndu', 'muslim', 'sikh', 'other']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? selected = await showSearch<String>(
                context: context,
                delegate: _CustomSearchDelegate(data: widget.list),
              );
              if (selected != null) {
                // Handle the selected item
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.star), // You can change the icon to represent a zodiac sign
            onPressed: () {
              navigateToRashiPage(context);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, i) {
          final item = filteredList[i];
          if (searchQuery.isNotEmpty && !item['name'].toLowerCase().contains(searchQuery.toLowerCase())) {
            return SizedBox.shrink(); // Hide the list item if it doesn't match the search query
          }
          Color color = i % 2 == 0 ? Colors.pink[200]! : Colors.pinkAccent;
          return Container(
            color: color,
            child: ListTile(
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("id: ${item['id'].toString()}"),
                  Text("name: ${item['name'].toString()}"),
                  Text("meaning: ${item['meaning'].toString()}"),
                  Text("gender: ${item['gender'].toString()}"),
                  Text("religion: ${item['religion'].toString()}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void navigateToRashiPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RashiPage()), // Replace RashiPage with your actual page
    );
  }

}

class _CustomSearchDelegate extends SearchDelegate<String> {
  final List data;

  _CustomSearchDelegate({required this.data});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List filteredData = data.where((item) =>
        item['name'].toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        Color color = index % 2 == 0 ? Colors.pink[200]! : Colors
            .pinkAccent; // Different color for even and odd rows
        return Container(
          color: color,
          child: ListTile(
            title: Text(item['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender: ${item['gender']}"),
                Text("Meaning: ${item['meaning']}"),
              ],
            ),
            onTap: () {
              close(context, item['name']);
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List filteredData = data.where((item) =>
        item['name'].toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredData.length,
      itemBuilder: (context, index) {
        final item = filteredData[index];
        Color color = index % 2 == 0 ? Colors.pink[200]! : Colors
            .pinkAccent; // Different color for even and odd rows
        return Container(
          color: color,
          child: ListTile(
            title: Text(item['name']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Gender: ${item['gender']}"),
                Text("Meaning: ${item['meaning']}"),
              ],
            ),
            onTap: () {
              query = item['name'];
              showResults(context);
            },
          ),
        );
      },
    );
  }
}
