package bean;

public class joinCartBean {
String image ,name;
int quantity, grandTotal,pid,id;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getGrandTotal() {
	return grandTotal;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public void setGrandTotal(int grandTotal) {
	this.grandTotal = grandTotal;
}
Double price;
public String getImage() {
	return image;
}
public void setImage(String image) {
	this.image = image;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
}
