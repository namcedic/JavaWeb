package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items;

	public Cart() {
		items = new ArrayList<>();
	}

	
	
/* Them sua, xoa san pham
 */
	public void add(Product cartItem) {
		for (Product x : items) {
			if (cartItem.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}
		}
		items.add(cartItem);
	}

	
	public void remove(int productID) {
		for (Product x : items) {
			if (x.getId() == productID) {
				items.remove(x);
				return;
			}
		}
	}

	
	public double getAmount() {
		double sum = 0;
		for (Product x : items) {
			sum += x.getPrice() * x.getNumber();
		}
		return Math.round(sum * 100.0) / 100.0;
	}

	public int getTotalItems() {
		int totalItem = 0;
		for (Product x : items) {
			totalItem += x.getNumber();
		}
		return totalItem;
	}

	
	public List<Product> getItems() {
		return items;
	}
}
