import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget BuildItemOfList(article, context) => GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(url: article['url'])));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                fit: BoxFit.cover,

                image: NetworkImage(
'https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-800x525.jpg'             ))),
              width: 150,
            ),
          ),
          Expanded(
            child: Container(
              height: 140.0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      ' ${article['title']}',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ),
                  Text('${article['publishedAt']}'),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget BuildSeparatorOfList() => Padding(
      padding: const EdgeInsets.only(top: 8.0,left: 8.0),
      child: Container(
        height: 1,
        color: Colors.grey,
      ),
    );

Widget BuildListOfArticle(List list, context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, index) => BuildItemOfList(list[index], context),
    separatorBuilder: (context, index) => BuildSeparatorOfList(),
    itemCount: list.length);
