package catshap.butler.dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.butler.bean.ProductView;
import catshap.butler.interfaces.ProductViewInterface;

public class ProductViewDao implements ProductViewInterface {

    private static Reader reader = null;
    private static SqlSessionFactory ssf = null;

    static {
        try {
            reader = Resources.getResourceAsReader("catshap/butler/conf/configuration.xml");
            ssf = new SqlSessionFactoryBuilder().build(reader);
        } catch (Exception ex) {
            ex.printStackTrace();
            throw new RuntimeException("Failed to initialize SqlSessionFactory.", ex);
        }
    }

    @Override
    public ProductView getProduct(int prodNo) throws Exception {
        try (SqlSession session = ssf.openSession()) {
            return session.selectOne("productview.getProduct", prodNo);
        }
    }

    @Override
    public int addCount(int prodNo) throws SQLException {
        try (SqlSession session = ssf.openSession()) {
            int result = session.insert("productview.addCount", prodNo);
            session.commit();
            return result;
        }
    }
}
