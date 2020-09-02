class SliderModel {
  String imagePath;
  String title;
  String desc;
  SliderModel({this.imagePath, this.title, this.desc});

  void setImageAssetPath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imagePath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();
  //1
  sliderModel.setImageAssetPath('images/mobile_life.png');
  sliderModel.setTitle('Search');
  sliderModel.setDesc('this is the mobile desc');
  slides.add(sliderModel);

  //2
  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath('images/thinking.png');
  sliderModel.setTitle('Thinking');
  sliderModel.setDesc('this is the Thinking desc');
  slides.add(sliderModel);

  //3
  sliderModel = new SliderModel();
  sliderModel.setImageAssetPath('images/friends.png');
  sliderModel.setTitle('friends');
  sliderModel.setDesc('this is the friend desc');
  slides.add(sliderModel);

  return slides;
}
