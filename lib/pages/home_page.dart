import 'package:flutter/material.dart';
import 'package:movie_ui/base_config.dart';
import 'package:movie_ui/model/movie.dart';
import 'package:movie_ui/pages/detail_movie_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text(
              "Movvi",
              style: TextStyle(
                color: white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "ew",
              style: TextStyle(
                color: primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: secondaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            // Popular
            Text(
              "Popular Movie",
              style: TextStyle(
                color: white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 230,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popularMovie.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailMoviePage(
                            popularMovie[index],
                          ),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: 140,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                popularMovie[index].imgPoster,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          child: Text(
                            popularMovie[index].title,
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            // Now Showing
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Now Showing",
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 170,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: nowShowing.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 110,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                nowShowing[index].imgPoster,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          child: Text(
                            nowShowing[index].title,
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            // Continue
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                "Now Showing",
                style: TextStyle(
                  color: white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 170,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: continueWatching.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 110,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                continueWatching[index].imgPoster,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 110,
                          child: Text(
                            continueWatching[index].title,
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
