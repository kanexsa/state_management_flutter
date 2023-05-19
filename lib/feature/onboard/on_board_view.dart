import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:state_management_flutter/feature/onboard/on_board_model.dart';
import 'package:state_management_flutter/feature/onboard/tab_indicator.dart';
import 'package:state_management_flutter/product/padding/page_padding.dart';
import 'package:state_management_flutter/product/widget/on_board_card.dart';

part './module/start_fab_button.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = "Skip Title";

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  bool get _isLastPage => OnBoardModels.onBoardItems.length - 1 == _selectedIndex;
  bool get _isFirstPage => _selectedIndex == 0;

  //Value Notifier
  ValueNotifier<bool> isBackEnable = ValueNotifier(false);
  //Value Notifier

  //default parameter used
  void _incrementAndChange([int? value]) {
    if (_isLastPage && value == null) {
      _changeBackEnable(true);
      return;
    }
    _changeBackEnable(false);
    _incrementSelectedPage(value);
  }

  void _changeBackEnable(bool value) {
    if (value == isBackEnable.value) return;
    isBackEnable.value = value;
  }

  void _incrementSelectedPage([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
              child: _pageViewItems(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabIndicator(
                  selectedIndex: _selectedIndex,
                ),
                _StartFabButton(
                  isLastPage: _isLastPage,
                  function: () {
                    _incrementAndChange();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [
        ValueListenableBuilder<bool>(
          valueListenable: isBackEnable,
          builder: (context, value, child) {
            return value ? const SizedBox() : TextButton(onPressed: () {}, child: Text(_skipTitle));
          },
        )
      ],
      leading: _isFirstPage
          ? null
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.chevron_left_outlined,
                color: Colors.grey,
              )),
    );
  }

  PageView _pageViewItems() {
    return PageView.builder(
      onPageChanged: (value) {
        _incrementAndChange(value);
      },
      itemCount: OnBoardModels.onBoardItems.length,
      itemBuilder: (context, index) {
        return OnBoardCard(model: OnBoardModels.onBoardItems[index]);
      },
    );
  }
}
