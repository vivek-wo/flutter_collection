import 'package:flutter/material.dart';
import 'mock_data.dart';

main() {
  runApp(MaterialApp(
    home: ListViewTest(),
  ));
}

class ListViewTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViewTest'),
      ),
      body: Container(
        color: Color(0xFFEFEFEF),
        child: ListView.builder(
            itemCount: subscribeAccountList.length,
            itemBuilder: (context, index) {
              return ListViewItem(
                data: subscribeAccountList[index],
                isLastIndex: index == subscribeAccountList.length - 1,
              );
            }),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final SubscribeAccountViewModel data;
  final isLastIndex;

  const ListViewItem({Key key, this.data, this.isLastIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomMargin = this.isLastIndex ? 16.0 : 0.0;
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, bottomMargin),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          this.renderAccountInfo(),
          this.renderCover(),
          this.renderArticles()
        ],
      ),
    );
  }

  Widget renderAccountInfo() {
    return Padding(
        padding: EdgeInsets.all(8),
        child: Row(children: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(this.data.accountImgUrl),
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Expanded(
              child: Text(this.data.accountName,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF666666)))),
          Text(this.data.publishTime,
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF999999),
              ))
        ]));
  }

  Widget renderCover() {
    final article = this.data.articles[0];
    final shouldClip = this.data.articles.length <= 1;
    return ClipRRect(
      borderRadius: !shouldClip
          ? BorderRadius.circular(0)
          : BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
      child: Stack(
        children: [
          Image.network(article.coverImgUrl, height: 150, fit: BoxFit.cover),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                  child: Text(article.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.white))))
        ],
      ),
    );
  }

  Widget renderArticles() {
    final articles = this.data.articles.sublist(1);
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(articles[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF333333)))),
                Padding(padding: EdgeInsets.all(10)),
                Image.network(
                  articles[index].coverImgUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                )
              ],
            ));
      },
      separatorBuilder: (context, index) {
        return Container(
            height: 1,
            margin: EdgeInsets.symmetric(horizontal: 15),
            color: Color(0xFFDDDDDD));
      },
      itemCount: articles.length,
    );
  }
}
