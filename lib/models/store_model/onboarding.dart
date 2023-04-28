class OnBoardingModel{
  final String image1;
  final String image2;
  final String image3;
  final String title;
  final String body;
  OnBoardingModel({required this.image1,required this.image2,required this.image3,required this.title,required this.body});
}
List<OnBoardingModel> boarding = [
  OnBoardingModel(
    image1: 'images/top_boarding.png',
    image2: 'images/smart_onboarding.png',
    image3: 'images/watch_onboarding.png',
    title: 'Discover New local products',
    body:
    'We Have a 50k+ Products. Choose Your product from our Ecommerce shop.',
  ),
  OnBoardingModel(
    image1: 'images/watch_onboarding.png',
    image2: 'images/lap_onboarding.png',
    image3: 'images/smart_onboarding.png',
    title: 'Discover New local products ',
    body:
    'We Have a 100k+ Products. Choose Your product from our E-commerce shop.',
  ),
  OnBoardingModel(
    image1: 'images/s.png',
    image2: 'images/watch_onboarding.png',
    image3: 'images/lap_onboarding.png',
    title: 'Discover New local products ',
    body:
    'We Have a 100k+ Products. Choose Your product from our E-commerce shop.',
  ),
];