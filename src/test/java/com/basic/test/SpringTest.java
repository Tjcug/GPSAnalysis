package com.basic.test;

import com.basic.Application;
import org.junit.runner.RunWith;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.boot.test.WebIntegrationTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

/**
 * Created by dello on 2016/6/6.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class)
@WebIntegrationTest("server.port:0")
@TransactionConfiguration(defaultRollback=false)
//@Transactional(propagation= Propagation.REQUIRED)
public class SpringTest {

//    @Autowired
//    private TUserDAO tUserDAO;
//
//    @Test
//    public void test(){
//        List<TUser> userList=tUserDAO.findList("from TUser");
//        for(TUser user: userList){
//            System.out.println(user.getPersonSignature());
//        }
//    }

}
