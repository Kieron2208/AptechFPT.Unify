package com.aptechfpt;

import com.aptechfpt.bean.PurchaseOrderFacadeLocal;
import com.aptechfpt.entity.PurchaseOrder;
import com.aptechfpt.utils.MaHoa;
import java.io.File;
import java.util.List;
import javax.ejb.EJB;
import org.jboss.arquillian.container.test.api.Deployment;
import org.jboss.arquillian.junit.Arquillian;
import org.jboss.shrinkwrap.api.Archive;
import org.jboss.shrinkwrap.api.ShrinkWrap;
import org.jboss.shrinkwrap.api.spec.WebArchive;
import org.jboss.shrinkwrap.resolver.api.maven.Maven;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.assertj.core.api.Assertions.*;
import org.junit.runner.RunWith;

/**
 *
 * @author Kiero
 */
@RunWith(Arquillian.class)
public class PurchaseOrderBeanTest {

    @Deployment
    public static Archive<?> deploy() {
        File[] libraries = Maven.resolver().loadPomFromFile("pom.xml")
                .importCompileAndRuntimeDependencies()
                .resolve("org.assertj:assertj-core")
                .withTransitivity()
                .asFile();

        WebArchive war = ShrinkWrap.create(WebArchive.class, "PurchaseOrderTest.war")
                .addPackage("com.aptechfpt.bean")
                .addPackage("com.aptechfpt.entity")
                .addPackage("com.aptechfpt.converter")
                .addPackage("com.aptechfpt.dto")
                .addPackage("com.aptechfpt.enumtype")
                .addPackage("com.aptechfpt.utils")
                //                .addAsManifestResource(file,"glassfish-resources.xml")
                .addAsResource("META-INF/persistence.xml")
                .addAsLibraries(libraries);
        System.out.println("EJB folder structure: ");
        System.out.println(war.toString(true));

        return war;
    }

    @EJB
    private PurchaseOrderFacadeLocal purchaseOrder;

    @Test
    public void hello() throws Exception {
        List<PurchaseOrder> list = purchaseOrder.getListByAccountId(3);
        MaHoa mh = new MaHoa();
        for (PurchaseOrder p : list) {
            p.setName(mh.decrypt(p.getName()));
            p.setAddress(mh.decrypt(p.getAddress()));
            p.setPhone(mh.decrypt(p.getPhone()));
        }
        for (PurchaseOrder p : list) {
            System.out.println("Id:" + p.getPurchaseOrderId());
            System.out.println("Account Email: " + p.getAccountId().getEmail());
            System.out.println("Name: " + p.getName());
            System.out.println("Phone: " + p.getPhone());
            System.out.println("Address: " + p.getAddress());
            System.out.println("Date: " + p.getCreatedDate().toString("ss:mm:hh dd/mm/YYYY"));
            System.out.println("Number of items: " + p.getPurchaseOrderDetailCollection().size());
            System.out.println("Total: " + p.getSubTotal());
            System.out.println("Status: " + p.getStatus());
        }
        assertThat(list.size()).isEqualTo(8);
    }

}
