package com.food.DAO;
import com.food.model.Menu;
import java.util.List;
import com.food.model.Menu;

public interface MenuDAO {


	void addMenu(Menu menu);
	
	Menu getMenu(int menuId);
	
	void updateMenu(Menu menu);
	
	void deleteMenu(int menu);
	
	List<Menu> getAllMenu(Menu menu);
	
	List<Menu> getMenuByResId(int restaurantId);
}
