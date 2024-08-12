package catshap.butler.interfaces;

import java.util.List;

import catshap.butler.bean.Image;

public interface ImageInterface {
		public abstract List<Image> selectImage() throws Exception;
}
