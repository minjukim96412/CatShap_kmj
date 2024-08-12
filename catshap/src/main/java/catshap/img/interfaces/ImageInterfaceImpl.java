package catshap.img.interfaces;

import java.util.List;

import catshap.img.bean.Image;
import catshap.img.dao.ImageDao;

public class ImageInterfaceImpl implements ImageInterface {
	
	private ImageDao imageDao;
	
	public ImageInterfaceImpl() {
		imageDao = new ImageDao();
	}

	@Override
	public List<Image> selectImage() throws Exception {
		return imageDao.selectImage();
	}

}
