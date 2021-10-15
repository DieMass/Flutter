import 'package:dio/dio.dart';
import 'package:first/post.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://itis-chat-app-ex.herokuapp.com/chat")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("")
  Future<List<Post>> getPosts();

  @POST("")
  Future<void> sendPost(@Body() Post post);
}