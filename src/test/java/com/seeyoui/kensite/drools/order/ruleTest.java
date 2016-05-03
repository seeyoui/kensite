package com.seeyoui.kensite.drools.order;

import java.util.Arrays;

import org.kie.api.KieBase;
import org.kie.api.io.ResourceType;
import org.kie.api.runtime.KieSession;
import org.kie.internal.KnowledgeBase;
import org.kie.internal.KnowledgeBaseFactory;
import org.kie.internal.builder.KnowledgeBuilder;
import org.kie.internal.builder.KnowledgeBuilderFactory;
import org.kie.internal.io.ResourceFactory;
import org.kie.internal.runtime.StatelessKnowledgeSession;

public class ruleTest {
	public static final void main(String[] args) throws Exception {
		ruleTest launcher = new ruleTest();
		launcher.executeExample();
	}

	public int executeExample() throws Exception {
		KnowledgeBuilder kbuilder = KnowledgeBuilderFactory.newKnowledgeBuilder();
		kbuilder.add(ResourceFactory.newClassPathResource("clock.drl", getClass()), ResourceType.DRL);
		if (kbuilder.hasErrors()) {
			System.err.print(kbuilder.getErrors());
			return -1;
		}
		KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
		kbase.addKnowledgePackages(kbuilder.getKnowledgePackages()); 
		StatelessKnowledgeSession ksession = kbase.newStatelessKnowledgeSession();
//		KieBase kiebase = null;
//		KieSession kieSession = kiebase.newKieSession();
//		kieSession.setGlobal( "myGlobalList", null);
		ksession.setGlobal("num", 200);
		Order o = new Order();
		o.setName("成功");
		ksession.setGlobal("o", o);
		
		Order order = new Order();
		order.setSumprice(220);

		Order order1 = new Order();
		order1.setSumprice(50);
		ksession.execute(Arrays.asList(new Object[] { order, order1 }));

		System.out.println("DISCOUNT IS: " + order.getDiscountPercent());
		System.out.println("DISCOUNT1 IS: " + order1.getDiscountPercent());

		return order.getDiscountPercent();
	}

}