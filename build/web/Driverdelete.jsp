
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.*,org.hibernate.*,org.hibernate.cfg.*" %>
<%! Session session1 = null; %>

<%
Configuration cf = new Configuration();
cf.configure("cfgPackage/Driver.cfg.xml");
SessionFactory sf = cf.buildSessionFactory();
session1 = sf.openSession();
Transaction tx = session1.beginTransaction();
String str=request.getParameter("c1");
int number=Integer.parseInt(str);
String sqr = "delete from Driver where id = :no";
Query qr = session1.createQuery(sqr);
qr.setParameter("no", number);
qr.executeUpdate();
tx.commit();
response.sendRedirect("driver.jsp");
%>
