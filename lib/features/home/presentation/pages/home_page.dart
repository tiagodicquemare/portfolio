import 'package:dicquemare_solution/core/injection.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/contact_me_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/course_content_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/project_content_widget.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/bloc/phone_container_bloc.dart';
import 'package:dicquemare_solution/features/phone_container/presentation/pages/smart_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double heightPhone = 600;
  double widthPhone = 350;
  bool isPhoneVisible = true;
  AlignmentGeometry? _lastAlignment;
  int selectedProfessionalCategory = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          if (_tabController.index != 1) {
            isPhoneVisible = true;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    heightPhone = CoreUtils.getPhoneScreenHeight(context);
    widthPhone = CoreUtils.getPhoneScreenWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dicquemare Solution'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Parcours'),
            Tab(text: 'Projets'),
            Tab(text: 'Contact'),
          ],
        ),
      ),
      body: containerHomeContent(_tabController.index + 1),
    );
  }

  Widget containerHomeContent(int index) {
    return BlocProvider(
        create: (blocContext) => sl<PhoneContainerBloc>(),
        child: BlocBuilder<PhoneContainerBloc, PhoneContainerState>(
            builder: (blocContext, state) {
          if (state is ShowProfessionalCategoriesState) {
            print('state.category home ${state.category}');
            selectedProfessionalCategory = state.category;
          }
          if (index == 1) {
            BlocProvider.of<PhoneContainerBloc>(blocContext).add(
                ShowProfessionalCategoriesEvent(
                    category: selectedProfessionalCategory));
          }
          return Stack(
            children: [
              extraContentDependingOnScreen(index),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [animatedRectangle(blocContext, index)],
                ),
              )
            ],
          );
        }));
  }

  Widget extraContentDependingOnScreen(int index) {
    if (index == 1) {
      return Positioned.fill(
        child: Padding(
          padding: EdgeInsets.only(left: widthPhone + 24),
          child: Container(
              color: Colors.green,
              child: CourseContentWidget(
                selectedCategory: selectedProfessionalCategory,
              )),
        ),
      );
    } else if (index == 2) {
      return ProjectContentWidget();
    } else {
      return Positioned.fill(
        child: Padding(
            padding: EdgeInsets.only(right: widthPhone + 24),
            child: ContactMeWidget()),
      );
    }
  }

  Widget animatedRectangle(BuildContext blocContext, int index) {
    Alignment getAlignment() {
      switch (index) {
        case 1:
          return Alignment.centerLeft;
        case 2:
          return Alignment.center;
        case 3:
          return Alignment.centerRight;
        default:
          return Alignment.centerLeft;
      }
    }

    final alignment = getAlignment();
    if (_lastAlignment != alignment) {
      BlocProvider.of<PhoneContainerBloc>(blocContext)
          .add(PhoneAnimationStartEvent());
    }
    _lastAlignment = alignment;
    return AnimatedAlign(
        alignment: getAlignment(),
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        onEnd: () {
          setState(() {
            isPhoneVisible = index != 2;
            BlocProvider.of<PhoneContainerBloc>(blocContext)
                .add(PhoneAnimationEndEvent());
          });
        },
        child: Visibility(
          visible: isPhoneVisible,
          child: SizedBox(
              width: widthPhone,
              height: heightPhone,
              child: SmartphoneWidget()),
        ));
  }
}
