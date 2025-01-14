import 'package:flutter/material.dart';
import 'package:flutter_project/ChatterCraft/Page/TagPage.dart';

import '../Tweet/Tweet.dart';
import '../Listpage/chattercraftlist.dart';
import '../Listpage/pathllist.dart';

class PageTwo extends StatefulWidget {
  late final List<Tweet> tweets = [];
  late final Function(Tweet) onTweetSubmitted;
  @override
  State<PageTwo> createState() => _StatePageTwo();
}

class _StatePageTwo extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
            itemCount: ChatterListe().list.length,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(15),
                  child: ListTile(
                      onTap: () {
                        int newindex = index;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TagPage(
                              index: newindex,
                              tweets: widget.tweets,
                              onTweetSubmitted: (Tweet tweet) {
                                setState(() {
                                  widget.tweets.add(tweet);
                                });
                              },
                              path: PathList().list2[index],
                            ),
                          ),
                        );
                      },
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.zero,
                            child: Icon(
                              Icons.bolt,
                              size: 30,
                              color: Color.fromRGBO(42, 40, 162, 1),
                            ),
                          ),
                          Text(ChatterListe().list[index]),
                        ],
                      ),
                      subtitle: RichText(
                        text: TextSpan(
                          children: <InlineSpan>[
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.bottom,
                              child: Icon(
                                Icons.place,
                                size: 15,
                                color: Color.fromARGB(255, 180, 123, 218),
                              ),
                            ),
                            TextSpan(
                              text: ' Mühendislik Fakültesinde ',
                              style: DefaultTextStyle.of(context).style,
                            ),
                            const TextSpan(
                              text: 'Şu an',
                              style: TextStyle(color: Color.fromARGB(255, 16, 187, 36)),
                            ),
                          ],
                        ),
                      )),
                )),
      ),
    );
  }
}
