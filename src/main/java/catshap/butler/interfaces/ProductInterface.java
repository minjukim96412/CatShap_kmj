package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.Product;


public interface ProductInterface {

	public abstract List<Product> selectAll(String category);
	
	
}
