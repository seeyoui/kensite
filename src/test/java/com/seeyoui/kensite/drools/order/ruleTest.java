package com.seeyoui.kensite.drools.order;

import java.util.Arrays;

import org.kie.api.io.ResourceType;
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

		KnowledgeBuilder kbuilder = KnowledgeBuilderFactory
				.newKnowledgeBuilder();

		kbuilder.add(ResourceFactory.newClassPathResource("discountrule.drl",
				getClass()), ResourceType.DRL);

		if (kbuilder.hasErrors()) {
			System.err.print(kbuilder.getErrors());
			return -1;
		}

		KnowledgeBase kbase = KnowledgeBaseFactory.newKnowledgeBase();
		kbase.addKnowledgePackages(kbuilder.getKnowledgePackages());

		StatelessKnowledgeSession ksession = kbase
				.newStatelessKnowledgeSession();

		Order order = new Order();
		order.setSumprice(159);
		ksession.execute(Arrays.asList(new Object[] { order }));

		System.out.println("DISCOUNT IS: " + order.getDiscountPercent());

		return order.getDiscountPercent();

	}

}