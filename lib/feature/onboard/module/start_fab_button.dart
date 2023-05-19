//part part of yaparak bu modülü sadece onboardview kullanıcılarına açtık. Programın bir başka noktasındı bu sınıf artık kullanılamaz.
part of '../on_board_view.dart';

class _StartFabButton extends StatelessWidget {
  const _StartFabButton({required this.isLastPage, this.function});

  final bool isLastPage;
  final VoidCallback? function;

  final String _nextButtonTitle = "Next";
  final String _startButtonTitle = "Start";

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: function,
      child: Text(isLastPage ? _startButtonTitle : _nextButtonTitle),
    );
  }
}
