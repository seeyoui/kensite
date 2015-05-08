import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.Deployment;
import org.activiti.explorer.servlet.ExplorerApplicationServlet;
import org.activiti.engine.impl.persistence.StrongUuidGenerator;

public class ActivitiDeploy {
	public static void test() {
		ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();
		RepositoryService repositoryService = processEngine.getRepositoryService();
		Deployment deployment = repositoryService.createDeployment()
		  .addClasspathResource("act/diagrams/helloworld.bpmn")
		  .deploy();
		System.out.println(repositoryService.createProcessDefinitionQuery().count());
	}
}
