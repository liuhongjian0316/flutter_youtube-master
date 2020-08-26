class Result {

  int status; //响应码

  String msg; //响应信息

  Object data; //响应的数据

  String ok; //没啥用 构造方法

  Result({this.status, this.msg, this.data, this.ok});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      status: json['status'],
      msg: json['msg'],
      data: json['data'],
      ok: json['ok'],
    );
  }
}