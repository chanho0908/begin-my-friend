package bookmark;

import java.sql.Timestamp;

public class BookmarkList {
	private String shopName;
	private String img;
	private String addr;
	private String shopno;
	private Timestamp reg;
	
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getShopno() {
		return shopno;
	}
	public void setShopno(String shopno) {
		this.shopno = shopno;
	}

}
