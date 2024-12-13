package com.food.DAO;

import java.util.List;

import com.food.model.Order;
import com.food.model.OrderHistory;

public interface OrderHistoryDAO {

void addOrderHistry(OrderHistory orderHistory);
	
	OrderHistory getOrderHistry(int orderHistoryId);
	
	void updateOrderHistry(OrderHistory orderHistory);
	
	void deleteOrderHistry(int orderHistoryId);
	
	List<OrderHistory> getAllOrderHistory(OrderHistory orderHistory);

	void addOrder(Order order);

	Order getOrder(int orderID);

	void updateOrder(Order order);

	void deleteOrder(int orderId);

	List<Order> getAllOrdersByUser(int userId);

	List<Order> getAllOrder(Order order);
}
