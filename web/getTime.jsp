<%-- 
    Document   : GetTime
    Created on : Dec 7, 2014, 7:06:52 PM
    Author     : Eoin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>

<%
    
String date = (new Date()).toString();
out.println("The current server time is: " + date);
    
%>