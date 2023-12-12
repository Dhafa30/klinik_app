import 'package:dio/dio.dart';
import '../helpers/api_client.dart';
import '../model/poli.dart';

class PoliService {
  Future<List<Poli>> listData() async {
    final Response response = await apiClient().get('poli');
    final List data = response.data as List;
    List<Poli> result = data.map((json) => Poli.fromJson(json)).toList();
    return result;
  }

  Future<Poli> simpan(Poli poli) async {
    var data = poli.toJson();
    final Response response = await apiClient().post('poli', data);
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> ubah(Poli poli, String id) async {
    var data = poli.toJson();
    final Response response = await apiClient().put('poli/${id}', data);
    print(response);
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> getById(String id) async {
    final Response response = await apiClient().get('poli/${id}');
    Poli result = Poli.fromJson(response.data);
    return result;
  }

  Future<Poli> hapus(Poli poli) async {
    final Response response = await apiClient().delete('poli/${poli.id}');
    Poli result = Poli.fromJson(response.data);
    return result;
  }
}
