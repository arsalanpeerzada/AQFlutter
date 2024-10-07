import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Utils/FileReaderClass.dart';
class QuranSearchPage extends StatefulWidget {
  @override
  _QuranSearchPageState createState() => _QuranSearchPageState();
}

class _QuranSearchPageState extends State<QuranSearchPage> {
  List<String> _allVerses = [];
  List<String> _filteredVerses = [];
  TextEditingController _searchController = TextEditingController();
  late FileReaderClass fileReaderClass;
  @override
  void initState() {
    super.initState();
    fileReaderClass = FileReaderClass();
    _loadQuranData();
    _searchController.addListener(_filterVerses);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadQuranData() async {
    // Load the Quran.txt file from the assets
    List<String> data = await fileReaderClass.readFile('topicverse.txt');
    List<String> dddd= data;
    setState(() {
      // Split the content by new lines or by your custom delimiter
      _allVerses = (data);
      //_filteredVerses = _allVerses;
    });
  }

  void _filterVerses() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        //_filteredVerses = _allVerses; // If no query, show all verses
      } else {
        _filteredVerses = _allVerses
            .where((verse) => verse.toLowerCase().contains(query))
            .toList(); // Filter verses based on query
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF003F38),
        centerTitle: false,
        title: Text("Search"),
        titleTextStyle: TextStyle(fontFamily: 'elmessiri',color: Colors.white,fontSize: 23),
        iconTheme: IconThemeData(
          color: Colors.white, // Set your desired color for the back button here
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search verses...',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 10,),
                Align(alignment: Alignment.centerRight, child: Text("${_filteredVerses.length} items found",style: TextStyle(fontFamily: 'elmessiri',color: Colors.black,fontSize: 16),))
              ],
            ),
          ),
          Expanded(
            child: _filteredVerses.isEmpty
                ? Center(child: Text('No results found'))
                : ListView.builder(
              itemCount: _filteredVerses.length,
              itemBuilder: (context, index) {
                String verseID = '';
                String verse = '';

                // Only process lines that start with '['
                if (_filteredVerses[index].startsWith('[')) {
                  // Split the string by ']' to extract verseID and verse
                  List<String> parts = _filteredVerses[index].split(']');
                  if (parts.length > 1) {
                    verseID = parts[0].replaceAll('[', ''); // Extract verseID and remove '['
                    verse = parts[1]; // The verse text after the ']'
                  }
                }

                // Only show non-empty verse items
                if (verseID.isNotEmpty && verse.isNotEmpty) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Row(
                          children: [
                            Text(
                              verseID,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'elmessiri',
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text(
                                verse,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'elmessiri',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  );
                } else {
                  // If line doesn't match criteria, return an empty container
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
