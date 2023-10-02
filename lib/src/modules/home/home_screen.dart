import 'package:news_gpt/src/app/design/constants/app_contants.dart';
import 'package:news_gpt/src/modules/profile/profile_screen.dart';
import 'package:news_gpt/src/shared/screens/exports.dart';

import '../../app/design/app_styles.dart';
import 'home_controller.dart';

import 'widgets/news_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SmartScaffold(
      appBar: const _CustomAppBar(),
      body: GetBuilder<HomeController>(builder: (controller) {
        final articlesList = controller.articlesList.value;
        return controller.bottomNarBarcurrentIndex == 0
            ? articlesList.isEmpty
                ? const Center(child: CircularProgressIndicator.adaptive())
                : NewsWidget(articles: articlesList)
            : const ProfileScreen();
      }),
      bottomNavigationBar: const _CustomBottomNavigationBar(),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppConstants.appName, style: appNameTextStyle),
      );
}

class _CustomBottomNavigationBar extends StatelessWidget {
  const _CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        elevation: 0,
        onTap: (value) => context.find<HomeController>().incrementNavBarIndex(value),
        currentIndex: context.find<HomeController>().bottomNarBarcurrentIndex,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      );
}
