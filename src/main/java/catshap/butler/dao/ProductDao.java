package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Product;
import catshap.butler.interfaces.ProductInterface;

public class ProductDao implements ProductInterface {

	private static Reader reader;
	private static SqlSessionFactory ssf;
	
	static {
		try {
			reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	@Override
    public List<Product> selectAll(String category) {
            return ssf.openSession().selectList("product.selectProductList", category);
    }

	

	

}
