
package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


public class UserDAO {
   public boolean check(User original){
      
      User db = null;
      Configuration cf=null;
      SessionFactory sf=null;
      Transaction tx=null;
      Session session=null;
      try{
      cf = new Configuration();
       cf.configure("cfgPackage/hibernate1.cfg.xml");
      sf = cf.buildSessionFactory();
      session = sf.openSession();
//      tx = session.beginTransaction();
      db = (User)session.get(User.class,original.getUsername());
      System.out.println(original.getUsername()+" "+original.getPassword());
      System.out.println(db);
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      finally{
      //tx.commit();
      session.close();
      sf.close();}
      
      if(db == null){
         return false;
        }
      else{          
               return db.equals(original);
        }
//      else{
//          System.out.println(original.getUsername()+" "+db.getUsername());
//          System.out.println(original.getPassword()+" "+db.getPassword());
//          System.out.println(original.getUsertype()+" "+db.getUsertype());
//         return false;
//        } 
      
    }
}   

