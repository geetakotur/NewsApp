// ignore_for_file: avoid_print

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/core/env/env.dart';
import 'package:newsapp/app/modules/home/controllers/home_controller.dart';
import 'package:newsapp/app/modules/home/views/components/card_view.dart';
import 'package:newsapp/app/modules/home/views/components/news_source_bottom_sheet.dart';
import 'package:newsapp/app/modules/home/views/components/search_view.dart';
import 'package:newsapp/app/modules/home/views/components/top_headline_text.dart';
import 'package:newsapp/app/modules/news_view/views/news_view.dart';
import 'package:newsapp/app/utils/error_page.dart';
import 'package:newsapp/app/utils/no_internet_page.dart';

import 'package:timeago/timeago.dart' as timeago;

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Obx(
        () => controller.isInternetConnected.value
            ? controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.isError.value
                    ? const ErrorPage()
                    : RefreshIndicator(
                        onRefresh: () => controller.fetchNews(),
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              title: const Text("Newsapp"),
                              backgroundColor: Env.colors.primaryBlue,
                              actions: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Row(
                                    children: [

                                      const SizedBox(width: 2),

                                    ],
                                  ),
                                )
                              ],
                            ),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 12),
                                child: SearchView(
                                  controller: controller.searchController,
                                  onPressed: () {
                                    controller.searchNews();
                                  },
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: TopHeadLinesText(),
                            ),
                            Obx(
                              () => SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    var data = controller.newsList[index];

                                    DateTime time = DateTime.parse(
                                        data.publishedAt.toString());
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => NewsView(), arguments: {
                                          'title': data.title,
                                          'description': data.description,
                                          'urlToImage': data.urlToImage,
                                          'newsSource': data.source!.name,
                                          'publishedAt': data.publishedAt,
                                          'url': data.url,
                                          'content': data.content,
                                        });
                                      },
                                      child: CardView(
                                          newsSource: data.source!.name,
                                          image: data.urlToImage ??
                                              "https://cdn.pixabay.com/photo/2013/07/12/19/16/newspaper-154444_960_720.png",
                                          title: data.title,
                                          dateTime: timeago.format(time)),
                                    );
                                  },
                                  childCount: controller.newsList.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
            : const NoInternetPage(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Env.colors.primaryBlue,
        onPressed: () {
          Get.bottomSheet(NewsSourceBottomSheet());
        },
        child: const Icon(Icons.filter_list_alt, color: Colors.white),
      ),
    );
  }
}
