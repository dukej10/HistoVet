import 'package:histovet/src/models/sale_model.dart';
import 'package:histovet/src/services/sale_service.dart';

class SaleController {
  final SaleService _service = SaleService();
  List<Sale> sales = [];

  Future<bool> addSale(Sale sale) async {
    bool respuesta;
    respuesta = await _service.addSale(sale);
    if (respuesta) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Sale>> allSales() async {
    sales = await _service.getSales();
    return sales;
  }

  Future<Sale> getSale(String id) async {
    Sale sale = await _service.getSaleBD(id);
    return sale;
  }
}
