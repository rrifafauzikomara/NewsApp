import 'package:flutter_modular/flutter_modular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:list_news/domain/entities/article_entity.dart';
import 'package:shared/common/common.dart';

class NewsHeader extends StatelessWidget {
  final ArticleEntity article;

  const NewsHeader({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    return SliverAppBar(
      expandedHeight: 400.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            article.urlToImage == null
                ? Container(
                    child: Center(
                      child: Icon(Icons.error),
                    ),
                    width: width,
                    height: 298.h,
                  )
                : Stack(
                    children: [
                      GestureDetector(
                        onTap: () => Modular.to.pushNamed(
                            Modular.get<NamedRoutes>().detailArticlePage,
                            arguments: article),
                        child: CachedNetworkImage(
                          height: 298.h,
                          width: width,
                          imageUrl: article.urlToImage,
                          fit: BoxFit.contain,
                          placeholder: (context, url) => Container(
                            child: Center(child: CircularProgressIndicator()),
                            height: 298.h,
                            width: width,
                          ),
                          errorWidget: (context, url, error) => Container(
                            child: Center(
                              child: Icon(Icons.error),
                            ),
                            width: width,
                            height: 298.h,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Card(
                          margin: EdgeInsets.all(0),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              Modular.get<LocaleKeys>().listNewsRelease.tr(),
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            Container(
              padding: EdgeInsets.all(5),
              height: 100.h,
              width: width,
              child: Center(
                child: Text(
                  article.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            Divider(height: 2.h),
          ],
        ),
      ),
    );
  }
}
