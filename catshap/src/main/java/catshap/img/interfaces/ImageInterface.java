package catshap.img.interfaces;

import java.util.List;

import catshap.img.bean.Image;

public interface ImageInterface {
		public abstract List<Image> selectImage() throws Exception;
}
