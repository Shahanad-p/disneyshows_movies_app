import 'package:flutter/material.dart';
import 'package:movie_app/constant/constant.dart';


class BuildPopularTvShows extends StatelessWidget {
  const BuildPopularTvShows({super.key, required this.snapshot});
  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => DetailScreen(
                //           movies: snapshot.data[index],
                //         )));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: 170,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constant.imagePath}${snapshot.data[index].posterPath}',
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}