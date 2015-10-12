package cn.org.generator;
import cn.org.rapid_framework.generator.GeneratorFacade;

public class GenerationTest {

	public static void main(String[]args)throws Exception{
		GeneratorFacade g = new GeneratorFacade();
		g.generateByTable("CMS_COMMENT","template_kensite");
		g.generateByTable("CMS_GUESTBOOK","template_kensite");
	}
}
