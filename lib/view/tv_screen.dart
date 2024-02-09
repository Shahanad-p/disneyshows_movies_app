import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/controller/home_provider.dart';
import 'package:movie_app/widgets/onair_tvshows.dart';
import 'package:movie_app/widgets/popular_tvshows.dart';
import 'package:movie_app/widgets/toprated_tvshows.dart';
import 'package:provider/provider.dart';

class TvScreen extends StatefulWidget {
  const TvScreen({super.key});

  @override
  State<TvScreen> createState() => _TvScreenState();
}

class _TvScreenState extends State<TvScreen> {
  @override
  Widget build(BuildContext context) {
    final fetchProvider = Provider.of<HomeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Top Rated TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.getHomeScreen(
                    url: Constant.topRatedTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BuildTopRatedTvShows(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 5),
            Text('Popular TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.getHomeScreen(
                    url: Constant.popularTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BuildPopularTvShows(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            // (),
            SizedBox(height: 5),
            Text('On The Air TV Shows',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            SizedBox(height: 5),
            SizedBox(
              child: FutureBuilder(
                future: fetchProvider.getHomeScreen(
                    url: Constant.popularTv, context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return BuildOnAirTvShows(
                      snapshot: snapshot,
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Text(
                      snapshot.error.toString(),
                      style: const TextStyle(color: Colors.white),
                    ));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
