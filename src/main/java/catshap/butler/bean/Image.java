package catshap.butler.bean;

public class Image {
	private String proddescript;
	private String prodimgpath;
	private String prodprice;
	private String proddetailname;

	public Image() {
	}

	public Image(String proddescript, String prodimgpath, String prodprice, String proddetailname) {
		super();
		this.proddescript = proddescript;
		this.prodimgpath = prodimgpath;
		this.prodprice = prodprice;
		this.proddetailname = proddetailname;
	}

	public String getProddescript() {
		return proddescript;
	}

	public void setProddescript(String proddescript) {
		this.proddescript = proddescript;
	}

	public String getProdimgpath() {
		return prodimgpath;
	}

	public void setProdimgpath(String prodimgpath) {
		this.prodimgpath = prodimgpath;
	}

	public String getProdprice() {
		return prodprice;
	}

	public void setProdprice(String prodprice) {
		this.prodprice = prodprice;
	}

	public String getProddetailname() {
		return proddetailname;
	}

	public void setProddetailname(String proddetailname) {
		this.proddetailname = proddetailname;
	}

	@Override
	public String toString() {
		return "Image [proddescript=" + proddescript + ", prodimgpath=" + prodimgpath + ", prodprice=" + prodprice
				+ ", proddetailname=" + proddetailname + "]";
	}
	
}// class
