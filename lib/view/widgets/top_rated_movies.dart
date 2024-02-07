import 'package:flutter/material.dart';
import 'package:movie_app/view/toprated_details.dart';

Widget buildTopRatedMovies() {
  return SizedBox(
    height: 220,
    width: double.infinity,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TopRatedDetails()));
            },
            child: Container(
              height: 200,
              width: 180,
              color: Colors.green,
            ),
          ),
        ),
      ),
    ),
  );
}
