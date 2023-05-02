class ApiConstant {
  static const String baseUrlPayment = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static String idCard = '3293535';
  static const LOGIN = 'https://elwekala.onrender.com/user/login';
  static const REGISTER = 'https://elwekala.onrender.com/user/register';
  static const PR0FILE = 'https://elwekala.onrender.com/user/profile';
  static const LAGOUT = 'https://elwekala.onrender.com/user/logout';
  static const ALLUSERS = 'https://elwekala.onrender.com/user/display';
  static const UPDATE = 'https://elwekala.onrender.com/user/update';
  static const DELETEUSER = 'https://elwekala.onrender.com/user/delete';//del
  static const FAVORITE = 'https://elwekala.onrender.com/favorite';
  static const HOMELAPTOPS = 'https://elwekala.onrender.com/product/Laptops';
  static const HOMESMARTPHONE= 'https://elwekala.onrender.com/product/Smart Phones';
  static const HOMESMARTWATCHS = 'https://elwekala.onrender.com/product/Smart%20Watches';
  static String visaUrl =
      '$baseUrlPayment/acceptance/iframes/722023?payment_token=$finalToken';
  static const getOrderId = '/ecommerce/orders';
  static const getPaymentKey = '/acceptance/payment_keys';
  static const paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SnVZVzFsSWpvaWFXNXBkR2xoYkNJc0luQnliMlpwYkdWZmNHc2lPalkzTkRnek1Td2lZMnhoYzNNaU9pSk5aWEpqYUdGdWRDSjkuYzg3dG1oTi1IMi1RNWlEZ1BBdEFZUUZnbUJWTFRrLWRlYTF1OG1TMVlmNU1hTVotOUJGMUNmRTJYZElaQzFzYkhSVl8xTWZLa3dCdmRpNlNPbWdfS0E=';
}
var authToken;
var orderPaymentId;
var finalToken;
var token;
var nationalId;
