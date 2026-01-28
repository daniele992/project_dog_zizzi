import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../widgets/homepageAppBar.dart';


class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends ConsumerState<MyHomePage> {

  /*final List<Widget> _pages = [

  ] */

  late final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; //Dark mode


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: HomepageAppbar(isDark: isDark),
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('For Support:'),
                accountEmail: Text(tEmailSupport),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.verified_user), title: Text('Profile')),
            ],
          ),
        ),

      ),
    );
  }
}


