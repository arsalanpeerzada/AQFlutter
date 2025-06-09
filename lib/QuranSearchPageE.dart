import 'package:alphabeticalquran/Models/QuranSearchResponse.dart';
import 'package:alphabeticalquran/Remote/ApiService.dart';
import 'package:alphabeticalquran/VerseDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuranSearchPageE extends StatefulWidget {
  @override
  _QuranSearchPageState createState() => _QuranSearchPageState();
}

class _QuranSearchPageState extends State<QuranSearchPageE> {
  final ApiService _apiService = ApiService();
  final ScrollController _scrollController = ScrollController();
  TextEditingController _searchController = TextEditingController();
  List<SearchResult> _results = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  //late QuranSearchResponse response;

  @override
  void initState() {
    super.initState();
    _fetchResults();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          !_isLoading &&
          _hasMore) {
        _fetchResults();
      }
    });

    _searchController.addListener(fetchNewSearch);
  }

  void fetchNewSearch() {
    _fetchResults(isNewSearch: true);
  }

  Future<void> _fetchResults({bool isNewSearch = false}) async {
    if (isNewSearch) {
      setState(() {
        _results.clear(); // Clear previous results
        _currentPage = 1; // Reset page to the first
        _hasMore = true; // Reset the "has more" flag
      });
    }

    if (!_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _apiService.fetchSearchResults(
          _searchController.text, _currentPage);
      setState(() {
        _results.addAll(response.results);
        _hasMore = _currentPage < response.totalPages;
        _currentPage++;
      });
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
                    suffixIcon: GestureDetector(
                      // onTap: () {
                      //   if (_searchController.text.trim().isNotEmpty) {
                      //     _fetchResults(isNewSearch: true);
                      //   }
                      // },
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                //Align(alignment: Alignment.centerRight, child: Text("${response.totalResults} items found",style: TextStyle(fontFamily: 'elmessiri',color: Colors.black,fontSize: 16),))
              ],
            ),
          ),
          Expanded(
            child: _results.isEmpty && _isLoading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    itemCount: _results.length + (_hasMore ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == _results.length) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final result = _results[index];

                      String resultEng = result.translations.isNotEmpty
                          ? result.translations[0].text
                              .replaceAll(RegExp(r'<[^>]*>'), '')
                          : "No translation available";
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
                                        VerseDetail(verseID: result.verseKey),
                                  ),
                                );
                              },
                              onLongPress: () {
                                Clipboard.setData(
                                  ClipboardData(
                                    text: '${result.verseKey} - $resultEng',
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    result.verseKey,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontFamily: 'elmessiri',
                                    ),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      resultEng,
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
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
