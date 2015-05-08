import java.lang.reflect.Method;


public class TestClass {
public static void main(String[] args) {
	Class clazz;
	try {
		clazz = Class.forName("Test");//包名.类名
		Method method = clazz.getMethod("say", String.class);//方法名，和参数的类对象
		method.invoke(clazz.newInstance(), "print hello word");//类的实例，和参数
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
