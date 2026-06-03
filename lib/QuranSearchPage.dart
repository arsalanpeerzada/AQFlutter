import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'VerseDetail.dart';
import 'alphaquranverse.dart';

class QuranSearchPage extends StatefulWidget {
  @override
  _QuranSearchPageState createState() => _QuranSearchPageState();
}

class _QuranSearchPageState extends State<QuranSearchPage> {
  List<ModelPage> _allVerses = [];
  List<ModelPage> _filteredVerses = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadQuranData();
    _searchController.addListener(_filterVerses);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadQuranData() async {
    try {
      final String response = await rootBundle.loadString('assets/topics_data.json');
      final List<dynamic> data = await json.decode(response);
      
      // Flatten the verses into a unique list
      Map<String, ModelPage> uniqueVerses = {};
      for (var topic in data) {
        List<dynamic> rawVerses = topic['verses'];
        for (var v in rawVerses) {
           String id = v['id'] ?? '';
           String text = v['text'] ?? '';
           if (id.isNotEmpty && text.isNotEmpty && !uniqueVerses.containsKey(id)) {
             uniqueVerses[id] = ModelPage(verseID: id, verse: text);
           }
        }
      }
      
      setState(() {
        _allVerses = uniqueVerses.values.toList();
      });
    } catch (e) {
      print('Error loading search data: $e');
    }
  }

  void _filterVerses() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        //_filteredVerses = _allVerses; // If no query, show all verses
      } else {
        _filteredVerses = _allVerses
            .where((verse) => verse.verse.toLowerCase().contains(query))
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
        titleTextStyle: TextStyle(
            fontFamily: 'elmessiri', color: Colors.white, fontSize: 23),
        iconTheme: IconThemeData(
          color:
              Colors.white, // Set your desired color for the back button here
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
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "${_filteredVerses.length} items found",
                      style: TextStyle(
                          fontFamily: 'elmessiri',
                          color: Colors.black,
                          fontSize: 16),
                    ))
              ],
            ),
          ),
          Expanded(
            child: _filteredVerses.isEmpty
                ? Center(child: Text('No results found'))
                : ListView.builder(
                    itemCount: _filteredVerses.length,
                    itemBuilder: (context, index) {
                      ModelPage modelPage = _filteredVerses[index];
                      String verseID = modelPage.verseID;
                      String verse = modelPage.verse;
                      
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VerseDetail(verseID: verseID),
                                  ),
                                );
                              },
                              onLongPress: () {
                                // Copy both verseID and verse to clipboard
                                Clipboard.setData(
                                  ClipboardData(
                                    text: '$verseID - $verse',
                                  ),
                                );
                              },
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
                          ),
                          SizedBox(
                            height: 1,
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
