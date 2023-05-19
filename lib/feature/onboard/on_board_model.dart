class OnBoardModel {
  final String title;
  final String description;
  final String imageName;

  OnBoardModel(this.title, this.description, this.imageName);


  String get imageWithPath => 'assets/images/ic_$imageName.png';
}


class OnBoardModels {
  static final List<OnBoardModel> onBoardItems = [
    OnBoardModel('Order your food', 'Now you can order food any time right from your mobile', 'chef'),
    OnBoardModel('Order your food', 'Now you can order food any time right from your mobile', 'delivery'),
    OnBoardModel('Order your food', 'Now you can order food any time right from your mobile', 'order')
  ];
}