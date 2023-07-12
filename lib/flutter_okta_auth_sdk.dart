import 'package:flutter/services.dart';
import 'package:flutter_okta_auth_sdk/base_request.dart';

class FlutterOktaAuthSdk {
  static const MethodChannel _channel = MethodChannel('flutter_okta_auth_sdk');

  bool isInitialized = false;

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  Future<void> createConfig(BaseRequest request) async {
    isInitialized = false;
    await _channel.invokeMethod(
        "createConfig", convertBaseRequestToMap(request));
    isInitialized = true;
  }

  Future<bool> signIn() async {
    if (isInitialized == false) {
      throw Exception("Cannot sign in before initializing Okta SDK");
    }
    return await _channel.invokeMethod('signIn');
  }

  Future<void> signOut() async {
    if (isInitialized == false) {
      throw Exception("Cannot sign out before initializing Okta SDK");
    }
    await _channel.invokeMethod('signOut');
  }

  Future<String?> getUser() async {
    if (isInitialized == false) {
      throw Exception("Cannot get user before initializing Okta SDK");
    }
    return await _channel.invokeMethod('getUser');
  }

  Future<bool> isAuthenticated() async {
    if (isInitialized == false) {
      throw Exception(
          "Cannot check authentication before initializing Okta SDK");
    }
    return await _channel.invokeMethod('isAuthenticated');
  }

  Future<String?> getAccessToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot get access token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('getAccessToken');
  }

  Future<String?> getIdToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot get id token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('getIdToken');
  }

  Future<String?> getRefreshToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot get refresh token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('getRefreshToken');
  }

  Future<bool> revokeAccessToken() async {
    if (isInitialized == false) {
      throw Exception(
          "Cannot revoke access token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('revokeAccessToken');
  }

  Future<bool> revokeIdToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot revoke id token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('revokeIdToken');
  }

  Future<bool> revokeRefreshToken() async {
    if (isInitialized == false) {
      throw Exception(
          "Cannot revoke refresh token before initializing Okta SDK");
    }
    return await _channel.invokeMethod('revokeRefreshToken');
  }

  Future<bool> clearTokens() async {
    if (isInitialized == false) {
      throw Exception("Cannot clear tokens before initializing Okta SDK");
    }
    return await _channel.invokeMethod('clearTokens');
  }

  Future<String?> introspectAccessToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot introspect before initializing Okta SDK");
    }
    return await _channel.invokeMethod('introspectAccessToken');
  }

  Future<String?> introspectIdToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot introspect before initializing Okta SDK");
    }
    return await _channel.invokeMethod('introspectIdToken');
  }

  Future<String?> introspectRefreshToken() async {
    if (isInitialized == false) {
      throw Exception("Cannot introspect before initializing Okta SDK");
    }
    return await _channel.invokeMethod('introspectRefreshToken');
  }

  Future<String?> refreshTokens() async {
    if (isInitialized == false) {
      throw Exception("Cannot refresh tokens before initializing Okta SDK");
    }
    return await _channel.invokeMethod('refreshTokens');
  }
}
