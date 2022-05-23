

class HttpHelper{
  // https://newsapi.org/v2/everything?q=sports&from=2022-04-18&sortBy=publishedAt&apiKey=796c4030b6af4717872ace61b13b0d75
  final String authority = "newsapi.org";
  
  final String apiKey = "563f652863be4cb3b1050637b2fc836b";
  final String baseUrlLocal = "localhost:3000";

  // news endpoint
  final String getNewsPath = "/v2/everything";

  // products endpoint
  final String getProductsPath = "/products";

}