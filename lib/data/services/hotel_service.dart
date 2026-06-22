part of "../data.dart";

class HotelService {
  // ==================== Hotel ====================

  Future<UHttpClientResponse> createHotel({
    required final UHotelCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Hotel/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readHotels({
    required final UHotelReadParams p,
    final Function(UResponse<List<UHotelResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Hotel/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UHotelResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UHotelResponse>.from((i as List<dynamic>).map((final dynamic x) => UHotelResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readHotelById({
    required final UIdParams p,
    final Function(UResponse<UHotelResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Hotel/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UHotelResponse>.fromJson(r.body, (final dynamic i) => UHotelResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateHotel({
    required final UHotelUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Hotel/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteHotel({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Hotel/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // ==================== HotelRoom ====================

  Future<UHttpClientResponse> createHotelRoom({
    required final UHotelRoomCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/HotelRoom/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readHotelRooms({
    required final UHotelRoomReadParams p,
    final Function(UResponse<List<UHotelRoomResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/HotelRoom/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UHotelRoomResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UHotelRoomResponse>.from((i as List<dynamic>).map((final dynamic x) => UHotelRoomResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readHotelRoomById({
    required final UIdParams p,
    final Function(UResponse<UHotelRoomResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/HotelRoom/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UHotelRoomResponse>.fromJson(r.body, (final dynamic i) => UHotelRoomResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateHotelRoom({
    required final UHotelRoomUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/HotelRoom/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteHotelRoom({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/HotelRoom/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // ==================== Dorm ====================

  Future<UHttpClientResponse> createDorm({
    required final UDormCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Dorm/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDorms({
    required final UDormReadParams p,
    final Function(UResponse<List<UDormResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Dorm/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UDormResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UDormResponse>.from((i as List<dynamic>).map((final dynamic x) => UDormResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormById({
    required final UIdParams p,
    final Function(UResponse<UDormResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Dorm/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormResponse>.fromJson(r.body, (final dynamic i) => UDormResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateDorm({
    required final UDormUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Dorm/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteDorm({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/Dorm/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // ==================== DormRoom ====================

  Future<UHttpClientResponse> createDormRoom({
    required final UDormRoomCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormRoom/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormRooms({
    required final UDormRoomReadParams p,
    final Function(UResponse<List<UDormRoomResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormRoom/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UDormRoomResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UDormRoomResponse>.from((i as List<dynamic>).map((final dynamic x) => UDormRoomResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormRoomById({
    required final UIdParams p,
    final Function(UResponse<UDormRoomResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormRoom/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormRoomResponse>.fromJson(r.body, (final dynamic i) => UDormRoomResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateDormRoom({
    required final UDormRoomUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormRoom/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteDormRoom({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormRoom/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  // ==================== DormBed ====================

  Future<UHttpClientResponse> createDormBed({
    required final UDormBedCreateParams p,
    final Function(UResponse<String> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBed/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<String>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormBeds({
    required final UDormBedReadParams p,
    final Function(UResponse<List<UDormBedResponse>> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBed/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UDormBedResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UDormBedResponse>.from((i as List<dynamic>).map((final dynamic x) => UDormBedResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormBedById({
    required final UIdParams p,
    final Function(UResponse<UDormBedResponse> r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBed/ReadById",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormBedResponse>.fromJson(r.body, (final dynamic i) => UDormBedResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateDormBed({
    required final UDormBedUpdateParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBed/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteDormBed({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UEmptyResponse e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBed/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UEmptyResponse.fromJson(r.body)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> createDormBedContract({
    required final UDormBedContractCreateParams p,
    final Function(UResponse<UDormBedContractResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedContract/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormBedContractResponse>.fromJson(r.body, (final dynamic i) => UDormBedContractResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormBedContract({
    required final UDormBedContractReadParams p,
    final Function(UResponse<List<UDormBedContractResponse>> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedContract/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<List<UDormBedContractResponse>>.fromJson(r.body, (final dynamic i) => List<UDormBedContractResponse>.from((i as List<dynamic>).map((final dynamic x) => UDormBedContractResponse.fromMap(x))))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateDormBedContract({
    required final UDormBedContractUpdateParams p,
    final Function(UResponse<UDormBedContractResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedContract/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormBedContractResponse>.fromJson(r.body, (final dynamic i) => UDormBedContractResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteDormBedContract({
    required final UIdParams p,
    final Function(UResponse<dynamic> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedContract/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> createDormBedInvoice({
    required final UDormBedInvoiceCreateParams p,
    final Function(UResponse<UDormBedInvoiceResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedInvoice/Create",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormBedInvoiceResponse>.fromJson(r.body, (final dynamic i) => UDormBedInvoiceResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> readDormBedInvoice({
    required final UDormBedInvoiceReadParams p,
    final Function(UResponse<List<UDormBedInvoiceResponse>> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedInvoice/Read",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(
      UResponse<List<UDormBedInvoiceResponse>>.fromJson(
        r.body,
        (final dynamic i) => List<UDormBedInvoiceResponse>.from((i as List<dynamic>).map((final dynamic x) => UDormBedInvoiceResponse.fromMap(x))),
      ),
    ),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> updateDormBedInvoice({
    required final UDormBedInvoiceUpdateParams p,
    final Function(UResponse<UDormBedInvoiceResponse> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedInvoice/Update",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<UDormBedInvoiceResponse>.fromJson(r.body, (final dynamic i) => UDormBedInvoiceResponse.fromMap(i))),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> deleteDormBedInvoice({
    required final UIdParams p,
    final Function(UResponse<dynamic> r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedInvoice/Delete",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );

  Future<UHttpClientResponse> payDormBedInvoice({
    required final UIdParams p,
    final Function(UEmptyResponse r)? onOk,
    final Function(UResponse<dynamic> e)? onError,
    final Function(String e)? onException,
  }) => UHttpClient.send(
    method: "POST",
    endpoint: "${U.baseUrl}/Hotel/DormBedInvoice/Invoice/Pay",
    body: p.toMap().add("apiKey", U.apiKey).add("token", ULocalStorage.getToken()).add("locale", ULocalStorage.getLocale()),
    onSuccess: (final Response r) => onOk?.call(UEmptyResponse.fromJson(r.body)),
    onError: (final Response r) => onError?.call(UResponse<dynamic>.fromJson(r.body, (final dynamic i) => i)),
    onException: (String e) => onException?.call(e),
  );
}
