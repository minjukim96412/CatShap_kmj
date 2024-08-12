package catshap.butler.dao;

import java.io.InputStream;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.Product;
import catshap.butler.interfaces.ProductInterface;

public class ProductDao implements ProductInterface {

	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
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
