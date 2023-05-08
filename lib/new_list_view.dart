import 'package:flutter/material.dart';
import 'package:newsapi/model/article.dart';


class NewsListView extends StatelessWidget {
  final List<Article> articles;

  const NewsListView({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailScreen(article: articles[index]),
              ),
            );
          },
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Image.network("${articles[index].urlToImage}"),
                Text(
                  "${articles[index].title}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  "${articles[index].description}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  const ArticleDetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${article.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${article.author}"),
            SizedBox(height: 16),
            Text("${article.description}"),
            Text("${article.title}"),
            Text("${article.publishedAt}"),
            Image.network("${article.urlToImage}"),
          //  Text("${article.description}"),
          ],
        ),
      ),
    );
  }
}
