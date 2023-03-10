import 'dart:developer';

import 'package:bloc/bloc.dart';

import '../../dto/order_product_dto.dart';
import '../../repositories/order/order_repository.dart';
import 'order_state.dart';

class OrderController extends Cubit<OrderState> {
  final OrderRepository _orderRepository;

  OrderController(this._orderRepository) : super(const OrderState.initial());

  void load(List<OrderProductDto> products) async {
    try {
      emit(state.copyWith(status: OrderStatus.loading));
      final paymentTypes = await _orderRepository.getAllPaymentTypes();
      emit(state.copyWith(
          orderProducts: products,
          status: OrderStatus.loaded,
          paymentTypes: paymentTypes));
    } catch (e, s) {
      log('Erro ao carregar página', error: e, stackTrace: s);
      emit(state.copyWith(
          status: OrderStatus.error, errorMessage: 'Erro ao carregar página'));
    }
  }

  void incrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];

    orders[index] = order.copyWith(amount: order.amount + 1);
    emit(
      state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder),
    );
  }

  void decrementProduct(int index) {
    final orders = [...state.orderProducts];
    final order = orders[index];
    final amount = order.amount;

    amount == 1
        ? {
            //analisar a exclusão do produto
          }
        : orders[index] = order.copyWith(amount: amount - 1);
    emit(
      state.copyWith(orderProducts: orders, status: OrderStatus.updateOrder),
    );
  }
}
