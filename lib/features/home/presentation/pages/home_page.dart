import 'package:dicquemare_solution/core/colors.dart';
import 'package:dicquemare_solution/core/injection.dart';
import 'package:dicquemare_solution/core/ui/animated_tab_bar.dart';
import 'package:dicquemare_solution/core/ui/green_gradient_background.dart';
import 'package:dicquemare_solution/core/utils.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/contact_me_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/course_content_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/desktop/project_content_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/mobile/contact_me_mobile_widget.dart';
import 'package:dicquemare_solution/features/home/presentation/widgets/mobile/project_content_mobile_widget.dart';
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
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double minWidth = 1200;
          double minHeight = 800;

          return _buildContent(context, constraints.maxWidth < minWidth);
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool mobile) {
    heightPhone = CoreUtils.getPhoneScreenHeight(context);
    widthPhone = CoreUtils.getPhoneScreenWidth(context);
    return Column(
      children: <Widget>[
        MyTabBar(tabController: _tabController),
        Expanded(
          child: BlocProvider(
            create: (blocContext) => sl<PhoneContainerBloc>(),
            child: BlocBuilder<PhoneContainerBloc, PhoneContainerState>(
              builder: (blocContext, state) {
                return GreenGradientBackground(
                  child: mobile
                      ? containerHomeMobileContent(
                          blocContext, _tabController.index + 1)
                      : containerHomeDesktopContent(
                          blocContext, state, _tabController.index + 1),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget containerHomeMobileContent(BuildContext context, int index) {
    if (index == 1) {
      return CourseContentWidget(
        selectedCategory: selectedProfessionalCategory,
      );
    } else if (index == 2) {
      return ProjectContentMobileWidget();
    } else {
      return SingleChildScrollView(child: ContactMeMobileWidget());
    }
  }

  Widget containerHomeDesktopContent(
      BuildContext blocContext, PhoneContainerState state, int index) {
    if (state is ShowProfessionalCategoriesState) {
      selectedProfessionalCategory = state.category;
    }
    if (index == 1) {
      BlocProvider.of<PhoneContainerBloc>(blocContext).add(
          ShowProfessionalCategoriesEvent(
              category: selectedProfessionalCategory));
    } else if (index == 3) {
      BlocProvider.of<PhoneContainerBloc>(blocContext)
          .add(ShowAdditionalContactInfoEvent());
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
  }

  Widget extraContentDependingOnScreen(int index) {
    if (index == 1) {
      return Positioned.fill(
        child: Padding(
          padding: EdgeInsets.only(left: widthPhone + 24),
          child: Container(
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
          return const Alignment(0.58, 0);
        case 3:
          return Alignment.centerRight;
        default:
          return Alignment.centerLeft;
      }
    }

    if (index == 2) {
      isPhoneVisible = false;
      BlocProvider.of<PhoneContainerBloc>(blocContext)
          .add(PhoneAnimationEndEvent());
    }

    final alignment = getAlignment();
    if (_lastAlignment != alignment) {
      BlocProvider.of<PhoneContainerBloc>(blocContext)
          .add(PhoneAnimationStartEvent());
    }
    _lastAlignment = alignment;

    return AnimatedAlign(
      alignment: alignment,
      duration: const Duration(milliseconds: 800),
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
          width: widthPhone + 3,
          height: heightPhone,
          child: SmartphoneWidget(),
        ),
      ),
    );
  }
}
