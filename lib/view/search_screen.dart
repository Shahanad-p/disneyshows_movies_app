import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/search_provider.dart';
import 'package:movie_app/view/detail_screen.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchMovieProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                child: TextFormField(
                  onChanged: (value) {
                    searchMovieProvider.searchMovies(value);
                  },
                  controller: searchMovieProvider.queryController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search for movies',
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.only(left: 15.10, top: 20.10),
                    suffixIcon:
                        searchMovieProvider.queryController.text.isNotEmpty
                            ? IconButton(
                                color: Colors.red,
                                icon: Icon(Icons.clear),
                                onPressed: () {
                                  searchMovieProvider.queryController.clear();
                                  searchMovieProvider.searchMovies('');
                                },
                              )
                            : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: SizedBox(
                  height: 650,
                  child: searchMovieProvider.searchResults.isEmpty
                      ? Center(
                          child: Text(
                            'No movies',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      : GridView.builder(
                          itemCount: searchMovieProvider.searchResults.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1 / 1.4),
                          itemBuilder: (context, index) {
                            final searchdata =
                                searchMovieProvider.searchResults[index];

                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                      movies: searchdata,
                                      id: searchdata.id!,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "${Constant.imagePath}${searchdata.posterPath}"),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.high),
                                    color: Colors.black.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
