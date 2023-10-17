import 'package:device_info_plus/device_info_plus.dart';

abstract interface class DeviceDataSource {
  Future<String> getManufacturer();
  Future<String> getModel();
  Future<String> getOSName();
  Future<String> getOSVersion();
}


class AndroidDeviceDataSource extends DeviceDataSource {
  AndroidDeviceDataSource({
    required AndroidDeviceInfo deviceInfo,
  })  : _deviceInfo = deviceInfo;

  final AndroidDeviceInfo _deviceInfo;

  @override
  Future<String> getManufacturer() async {
    return _deviceInfo.manufacturer;
  }

  @override
  Future<String> getModel() async {
    return _deviceInfo.model;
  }

  @override
  Future<String> getOSName() async {
    return 'Android';
  }

  @override
  Future<String> getOSVersion() async {
    return _deviceInfo.version.release;
  }
}


class IOSDeviceDataSource extends DeviceDataSource {
  IOSDeviceDataSource({
    required IosDeviceInfo deviceInfo,
  })  : _deviceInfo = deviceInfo;

  final IosDeviceInfo _deviceInfo;

  @override
  Future<String> getManufacturer() async {
    return 'Apple';
  }

  @override
  Future<String> getModel() async {
    if (_deviceInfo.isPhysicalDevice) {
      return _deviceInfo.utsname.machine;
    } else {
      return '${_deviceInfo.utsname.machine}(iOS_Simulator)';
    }
  }

  @override
  Future<String> getOSName() async {
    return _deviceInfo.systemName;
  }

  @override
  Future<String> getOSVersion() async {
    return _deviceInfo.systemVersion;
  }
}


class WebDeviceDataSource extends DeviceDataSource {
  WebDeviceDataSource({
    required WebBrowserInfo deviceInfo,
  })  : _deviceInfo = deviceInfo;

  final WebBrowserInfo _deviceInfo;

  @override
  Future<String> getManufacturer() async {
    return _deviceInfo.vendor ?? '';
  }

  @override
  Future<String> getModel() async {
    return _deviceInfo.vendorSub ?? '';
  }

  @override
  Future<String> getOSName() async {
    return _deviceInfo.browserName.name ?? '';
  }

  @override
  Future<String> getOSVersion() async {
    return _deviceInfo.appVersion ?? '';
  }
}


class UnknownDeviceDataSource extends DeviceDataSource {
  @override
  Future<String> getManufacturer() async {
    return 'Unknown';
  }

  @override
  Future<String> getModel() async {
    return 'Unknown';
  }

  @override
  Future<String> getOSName() async {
    return 'Unknown';
  }

  @override
  Future<String> getOSVersion() async {
    return 'Unknown';
  }
}
