import 'package:flutter/material.dart';
import 'package:movie_ui/base_config.dart';
import 'package:movie_ui/model/movie.dart';

class DetailMoviePage extends StatefulWidget {
  final Movie movie;

  DetailMoviePage(this.movie);
  @override
  _DetailMoviePageState createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.movie.title,
          style: TextStyle(
            color: white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: secondaryColor,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    widget.movie.imgPoster,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      secondaryColor,
                      secondaryColor.withOpacity(0.8),
                      secondaryColor.withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: TextStyle(
                          color: white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${widget.movie.year}, ${widget.movie.genre}, ${widget.movie.minute} Minute",
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            widget.movie.rating.toString(),
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 5),
                          ...List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: (index < (widget.movie.rating / 2).floor())
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                "Overview",
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Text(
                widget.movie.overview,
                style: TextStyle(
                  color: white.withOpacity(0.7),
                  fontSize: 17,
                ),
              ),
            ),
            if (widget.movie.casts.length > 0) ...[
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  "Cast",
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.only(left: 15, top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movie.casts.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  widget.movie.casts[index].image,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            widget.movie.casts[index].name,
                            style: TextStyle(
                              color: white.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
