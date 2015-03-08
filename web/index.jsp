<%-- 
    Document   : index
    Created on : Nov 15, 2014, 5:22:56 PM
    Author     : Eoin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
import = "javax.xml.transform.Source,
javax.xml.transform.Transformer,
javax.xml.transform.TransformerConfigurationException,
javax.xml.transform.TransformerException,
javax.xml.transform.TransformerFactory,
javax.xml.transform.stream.StreamResult,
javax.xml.transform.stream.StreamSource,
com.google.gson.Gson,
com.google.gson.JsonIOException,
com.google.gson.JsonSyntaxException,
com.google.gson.reflect.TypeToken,
java.io.IOException,
java.io.InputStream,
java.io.InputStreamReader,
java.net.URL,
java.net.URLEncoder,
java.util.Map"
%>
<%
//get paths 
    
String ls_path = request.getServletPath();
ls_path = ls_path.substring(0,ls_path.indexOf("index.jsp"));

//set xml path
String ls_xml = application.getRealPath(ls_path + "movies.xml");


//create source
StreamSource streamsource = new StreamSource (ls_xml);
//create result
StreamResult streamResult = new StreamResult(out);
//create TransformerFactory
TransformerFactory tFactory = TransformerFactory.newInstance();
//determining XSL style sheet based on the processing instruction in the source document
Source stylesheet = tFactory.getAssociatedStylesheet(streamsource, null, null, null);
//create the transformer
Transformer transformer = tFactory.newTransformer(stylesheet);
transformer.setParameter("vPlot", "test");
//Use the transform() method of the transformer to transform a source into a result
transformer.transform(streamsource, streamResult);
//System.out.println(ls_xml);
%>

