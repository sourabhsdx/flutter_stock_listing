class StockList {
  List<String> _columns;
  List<Data> _data;
  int _draw;
  Null _drugList;
  Null _loggedIn;
  Null _programList;
  int _recordsTotal;
  Null _session;
  String _stockList;

  StockList(
      {List<String> columns,
        List<Data> data,
        int draw,
        Null drugList,
        Null loggedIn,
        Null programList,
        int recordsTotal,
        Null session,
        String stockList}) {
    this._columns = columns;
    this._data = data;
    this._draw = draw;
    this._drugList = drugList;
    this._loggedIn = loggedIn;
    this._programList = programList;
    this._recordsTotal = recordsTotal;
    this._session = session;
    this._stockList = stockList;
  }

  List<String> get columns => _columns;
//  set columns(List<String> columns) => _columns = columns;
  List<Data> get data => _data;
//  set data(List<Data> data) => _data = data;
//  int get draw => _draw;
//  set draw(int draw) => _draw = draw;
//  Null get drugList => _drugList;
//  set drugList(Null drugList) => _drugList = drugList;
//  Null get loggedIn => _loggedIn;
//  set loggedIn(Null loggedIn) => _loggedIn = loggedIn;
//  Null get programList => _programList;
//  set programList(Null programList) => _programList = programList;
  int get recordsTotal => _recordsTotal;
//  set recordsTotal(int recordsTotal) => _recordsTotal = recordsTotal;
//  Null get session => _session;
//  set session(Null session) => _session = session;
//  String get stockList => _stockList;
//  set stockList(String stockList) => _stockList = stockList;

  StockList.fromJson(Map<String, dynamic> json) {
    _columns = json['columns'].cast<String>();
    if (json['data'] != null) {
      _data = new List<Data>();
      json['data'].forEach((v) {
        _data.add(new Data.fromJson(v));
      });
    }
    _draw = json['draw'];
    _drugList = json['drugList'];
    _loggedIn = json['loggedIn'];
    _programList = json['programList'];
    _recordsTotal = json['recordsTotal'];
    _session = json['session'];
    _stockList = json['stockList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['columns'] = this._columns;
    if (this._data != null) {
      data['data'] = this._data.map((v) => v.toJson()).toList();
    }
    data['draw'] = this._draw;
    data['drugList'] = this._drugList;
    data['loggedIn'] = this._loggedIn;
    data['programList'] = this._programList;
    data['recordsTotal'] = this._recordsTotal;
    data['session'] = this._session;
    data['stockList'] = this._stockList;
    return data;
  }
}

class Data {
  int _availableQty;
  String _batchNo;
  Null _drugId;
  String _drugName;
  String _expiryDate;
  String _manufactureDate;
  Null _stockId;

  Data(
      {int availableQty,
        String batchNo,
        Null drugId,
        String drugName,
        String expiryDate,
        String manufactureDate,
        Null stockId}) {
    this._availableQty = availableQty;
    this._batchNo = batchNo;
    this._drugId = drugId;
    this._drugName = drugName;
    this._expiryDate = expiryDate;
    this._manufactureDate = manufactureDate;
    this._stockId = stockId;
  }

  int get availableQty => _availableQty;
//  set availableQty(int availableQty) => _availableQty = availableQty;
  String get batchNo => _batchNo;
//  set batchNo(String batchNo) => _batchNo = batchNo;
//  Null get drugId => _drugId;
//  set drugId(Null drugId) => _drugId = drugId;
  String get drugName => _drugName;
//  set drugName(String drugName) => _drugName = drugName;
  String get expiryDate => _expiryDate;
//  set expiryDate(String expiryDate) => _expiryDate = expiryDate;
  String get manufactureDate => _manufactureDate;
//  set manufactureDate(String manufactureDate) =>
//      _manufactureDate = manufactureDate;
//  Null get stockId => _stockId;
//  set stockId(Null stockId) => _stockId = stockId;

  Data.fromJson(Map<String, dynamic> json) {
    _availableQty = json['available_qty'];
    _batchNo = json['batch_no'];
    _drugId = json['drug_id'];
    _drugName = json['drug_name'];
    _expiryDate = json['expiry_date'];
    _manufactureDate = json['manufacture_date'];
    _stockId = json['stock_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_qty'] = this._availableQty;
    data['batch_no'] = this._batchNo;
    data['drug_id'] = this._drugId;
    data['drug_name'] = this._drugName;
    data['expiry_date'] = this._expiryDate;
    data['manufacture_date'] = this._manufactureDate;
    data['stock_id'] = this._stockId;
    return data;
  }
}
