abstract class BaseModel<T> {
  Map<String, dynamic> toJson();
  T fromjson(Map<String, Object> json);
}
