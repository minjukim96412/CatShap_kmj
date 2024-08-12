package catshap.img.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import catshap.img.bean.Image;
import catshap.img.interfaces.ImageInterface;

public class ImageDao implements ImageInterface{
	private static Reader reader = null;
	private static SqlSessionFactory ssf = null;
	
	static {
		try {
			reader = Resources.getResourceAsReader("conf/configuration.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<Image> selectImage() throws Exception {
		return ssf.openSession().selectList("Image.selectImage");
	}
	
}
