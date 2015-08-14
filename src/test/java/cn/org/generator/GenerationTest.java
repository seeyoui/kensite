package cn.org.generator;
import cn.org.rapid_framework.generator.GeneratorFacade;

public class GenerationTest {

	public static void main(String[]args)throws Exception{
		GeneratorFacade g = new GeneratorFacade();
		g.generateByTable("T_EMPLOYEE","template_kensite");
	}
}
