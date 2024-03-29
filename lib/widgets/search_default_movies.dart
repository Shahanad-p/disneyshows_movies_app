import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';
import 'package:movie_app/models/movies_model.dart';
import 'package:movie_app/view/detail_screen.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({
    Key? key,
    required this.data,
    required this.snapshot,
  }) : super(key: key);

  final List<Movies> data;
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    movies: snapshot.data[index],
                    id: snapshot.data[index].id,
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6.0,
                      offset: Offset(0.0, 2.0),
                    ),
                  ],
                ),
                child: Image.network(
                  "${Constant.imagePath}${snapshot.data[index].posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.5,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayAnimationDuration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
