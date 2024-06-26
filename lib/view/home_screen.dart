import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/widgets/movie_ui_screen.dart';
import 'package:movie_app/widgets/trending_movies.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/Purple Modern Future Destiny Movie Poster.png',
          fit: BoxFit.cover,
          height: 60,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Trending Movies',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(height: 10.10),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.trendingUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data as List<Movies>;
                      return TrendingMovies(
                        data: data,
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                      ));
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 5.8),
              Text('Top Rated Movies',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.topRatedUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return MovieUiScreen(
                        data: data,
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                      ));
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
              SizedBox(height: 5),
              Text('Now Playing',
                  style: TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              SizedBox(height: 10),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.nowPlayingUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return MovieUiScreen(
                        data: data,
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                      ));
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Upcoming Movies',
                style: TextStyle(
                    color: Colors.amberAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(height: 5),
              SizedBox(
                child: FutureBuilder(
                  future: fetchProvider.fetchDatas(
                      url: Constant.upcomigUrl, context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return MovieUiScreen(
                        data: data,
                        snapshot: snapshot,
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(color: Colors.white),
                      ));
                    } else {
                      return Text('');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
