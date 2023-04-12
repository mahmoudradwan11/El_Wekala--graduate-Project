class ApiConstant {
  static const String baseUrlPayment = 'https://accept.paymob.com/api';
  static const String baseUrlStore = 'https://student.valuxapps.com/api/';
  static const String getAuthToken = '/auth/tokens';
  static String idCard = '3293535';
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
