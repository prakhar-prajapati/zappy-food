package bean;

public class orderBean {
int oid,pid,quantity,status;
String user ,address,datetime;
public String getDatetime() {
	return datetime;
}
public void setDatetime(String datetime) {
	this.datetime = datetime;
}
public int getOid() {
	return oid;
}
public void setOid(int oid) {
	this.oid = oid;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
double total;

	
	
}
