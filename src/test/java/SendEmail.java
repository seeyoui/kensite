import org.apache.commons.mail.HtmlEmail;

public class SendEmail {
	public static void main(String[] args) {
		HtmlEmail hemail = new HtmlEmail();
		 try {
		 hemail.setHostName("smtp.163.com");
		 hemail.setCharset("utf-8");
		 hemail.addTo("seeyouiken@163.com");
		 hemail.setFrom("kensitecc@163.com", "ken");
		 hemail.setAuthentication("kensitecc@163.com", "kensite192");
		 hemail.setSubject("sendemail test!");
		 hemail.setMsg("<a href=\"http://www.google.cn\">谷歌</a><br/>");
		 hemail.send();
		 System.out.println("email send true!");
		 } catch (Exception e) {
		 e.printStackTrace();
		 System.out.println("email send error!");
		 }
	}
}
