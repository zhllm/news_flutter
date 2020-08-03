import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;

  int timeStamp;

  Response response;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}

class NetCache extends Interceptor {
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  Future onRequest(RequestOptions options) async {
    if (!CACHE_ENABLE) return options;

    bool refresh = options.extra['refresh'] == true;
    bool cacheDisk = options.extra['cacheDisk'] == true;

    if (refresh) {
      if (options.extra['list'] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        delete(options.uri.toString());
      }

      if (cacheDisk) {
        // StorageUtil().
      }
      return options;
    }

    if (options.extra['noCache'] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();
      var obj = cache[key];
      if (cache == null) {
        if ((DateTime.now().millisecondsSinceEpoch - obj.timeStamp) / 1000 <
            CACHE_MAXAGE) {
          return cache[key].response;
        } else {
          cache.remove(key);
        }
      }
      if (cacheDisk) {
        var cacheData = StorageUtil().getJSON(key);
        if (cacheDisk != null) {
          return Response(
            statusCode: 200,
            data: cacheData,
          );
        }
      }
    }
  }

  delete(String key) {
    cache.remove(key);
  }

  @override
  Future onResponse(Response response) async {
    if (CACHE_ENABLE) {
      return await _saveCache(response);
    }
  }

  Future<void> _saveCache(Response obj) async {
    RequestOptions options = obj.request;

    if (options.extra['noCache'] != true &&
        options.method.toLowerCase() == 'get') {
      String key = options.extra['cacheKey'] ?? options.uri.toString();

      if (options.extra['cacheDisk'] == true) {
        await StorageUtil().setJSON(key, obj.data);
      }

      if (cache.length == CACHE_MAX_COUNT) {
        cache.remove(cache[cache.keys.first]);
      }

      cache[key] = CacheObject(obj);
    }
  }

  @override
  Future onError(DioError err) async {}
}
