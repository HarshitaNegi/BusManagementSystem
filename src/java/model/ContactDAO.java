
package model;
 
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

 
public class ContactDAO {
 
    public void addContactDetails(String sname, String ids, String inquiry) {
        try {
            Configuration configuration = new Configuration().configure("cfgPackage/hibernate1.cfg.xml");
            SessionFactory sessionFactory = configuration.buildSessionFactory();
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            Contact contact = new Contact();
            contact.setSname(sname);
            contact.setIds(ids);
            contact.setInquiry(inquiry);
            session.save(contact);
            transaction.commit();
            System.out.println("\n\n Details Added \n");
 
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("error");
        }
 
    }
 
}
