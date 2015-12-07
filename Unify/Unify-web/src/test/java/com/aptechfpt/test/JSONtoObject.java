package com.aptechfpt.test;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kiero
 */
public class JSONtoObject {

    public JSONtoObject() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Test
    public void hello() {
        Gson gson = new Gson();
        String json = "[{\"id\":1,\"name\":\"T-Shirt01\",\"pic\":\"img/product/Tshirt01.jpg\",\"price\":140,\"quantity\":2,\"total\":280},{\"id\":2,\"name\":\"T-Shirt02\",\"pic\":\"img/product/Tshirt02.jpg\",\"price\":145,\"quantity\":2,\"total\":290}]";

        Type collectionType = new TypeToken<ArrayList<PODTO>>() {}.getType();
        List<PODTO> PODTO = new Gson().fromJson(json, collectionType);  
        
        for (PODTO o : PODTO) {
            System.out.println("id: " + o.id);
            System.out.println("name: "+ o.name);
            System.out.println("pic: " + o.pic);
            System.out.println("price: "+ o.price.toString());
            System.out.println("quantity: " + o.quantity);
            System.out.println("total: "+ o.total.toString());
        }
    }
    
}

    class PODTO {
        public int id;
        public String name;
        public String pic;
        public BigDecimal price;
        public int quantity;
        public BigDecimal total;
}
