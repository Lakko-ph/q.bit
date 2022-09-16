import 'package:flutter/material.dart';

void main(){
	runApp(const MainApp);
}
class MainApp extends StatelessWidget {
  const MainApp({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
			home: HomeScreen(),
		);
	}
}
class HomeScreen extends StatefulWidget {
	const HomeScreen({Key? key}) : super(key: key);
	_HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
	List homeButtons = [
		'Remote',
		'Timelapse',
		'Video',
		'HDR',
		'Star',
		'Laser',
		'Lightning',
		'Drop',
		'Vibrate',
		'Golden_Hour',
		'Star_Rules',
	];


	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: const Color(0xFF161d25),
			body: SafeArea(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.start,
					crossAxisAlignment: CrossAxisAlignment.center,
					children: [
						Expanded(
							child: Theme(
								data: ThemeData(canvasColor: Colors.transparent),
								child: ReorderableListView(
									padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
									children: <Widget>[
										for (final items in homeButtons)
											Card(
												child: Container(
													clipBehavior: Clip.antiAlias,
													alignment: Alignment.center,
													height: 50.0,
													width: double.infinity,
													decoration: BoxDecoration(
														gradient: const LinearGradient(
															colors: [
																Color(0xFF3b474f),
																Color(0xFF232b32),
															],
															stops: [0, 1],
															begin: AlignmentDirectional(1, -1),
															end: AlignmentDirectional(-1, 1),
														),
														borderRadius: BorderRadius.circular(10),
													),
													child: ListTile(
														title: Text(
															'testo',
														),
														leading: Icon(
															Icons.navigate_next,
															color: Colors.white,
														),
														trailing: Icon(
															Icons.navigate_next,
															color: Colors.white,
														),
													),
												),
												key: ValueKey(items),
												shape: RoundedRectangleBorder(
														borderRadius: BorderRadius.circular(10.0)),
											),
									],
									onReorder: (oldIndex, newIndex) async {
										setState(() {
											if (newIndex > oldIndex) {
												newIndex -= 1;
											}
											final items = homeButtons.removeAt(oldIndex);
											homeButtons.insert(newIndex, items);
										});
									},
								),
							),
						),
					],
				),
			),
		);
	}
}
