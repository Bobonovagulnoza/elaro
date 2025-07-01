import 'package:dio/dio.dart';
import 'package:elaro/features/data/products/products_remote.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'product_client_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late ProductsRemote apiClient;

  setUp(() {
    mockDio = MockDio();
    apiClient = ProductsRemote(dio: mockDio);
  });

  test('Ma\'lumot muvaffaqiyatli qaytsa - Map qaytaradi', () async {
    final responsePayload = {
      'data': {
        'products': [
          {'id': 1, 'name_uz': 'Test product'},
        ],
      },
    };

    when(
      mockDio.get(
        '/categories/3',
        queryParameters: {
          'min_price': '10000',
          'max_price': '2000000',
          'color': '#000000',
        },
      ),
    ).thenAnswer(
      (_) async => Response(
        data: responsePayload,
        statusCode: 200,
        requestOptions: RequestOptions(path: '/categories/3'),
      ),
    );

    final result = await apiClient.fetchProductsByFilter(
      '10000',
      '2000000',
      '#000000',
    );

    expect(result, responsePayload);
  });

  test('Xatolik holatida - Exception chiqaradi', () async {
    when(
      mockDio.get(any, queryParameters: anyNamed('queryParameters')),
    ).thenAnswer(
      (_) async => Response(
        data: 'error',
        statusCode: 500,
        requestOptions: RequestOptions(path: '/categories/3'),
      ),
    );

    expect(
      () async => await apiClient.fetchProductsByFilter('0', '0', '#fff'),
      throwsA(isA<Exception>()),
    );
  });
}
