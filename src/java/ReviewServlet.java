/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.xmldb.api.DatabaseManager;
import org.xmldb.api.base.Collection;
import org.xmldb.api.base.Database;
import org.xmldb.api.modules.XMLResource;
import org.xmldb.api.modules.XQueryService;

/**
 *
 * @author Eoin
 */
@WebServlet(name="ReviewServlet", urlPatterns = {"/ReviewServlet"})
public class ReviewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String path = getServletContext().getRealPath("/");
        
        String XSLFileName = path + java.io.File.separator + "template.xsl";
        File XslFile = new File(XSLFileName);
        
        //Exist database driver and URI
        String URI = "xmldb:exist://localhost:8444/exist/xmlrpc";
        String driver = "org.exist.xmldb.DatabaseImpl";

        XMLResource res = null;
        Node resNode = null;
        Document doc = null;
        String title = "";
        title = request.getParameter("title");
        //title = "Raiders Of The Lost Ark";
        String review = "";
        
        review = request.getParameter("review");
        
        try{
            //create database object and register database
            Class cl = Class.forName(driver);
            Database database = (Database) cl.newInstance();
            DatabaseManager.registerDatabase(database);
            
            //get the collection
            Collection col = DatabaseManager.getCollection(URI + "/db/Movies","admin","");
            
            //set the review into the XML
            XQueryService service = (XQueryService) col.getService("XQueryService", "1.0");

            service.setProperty("indent", "yes");
            
           String queryString = "";
            if (!(review.equals(""))) {
                service.declareVariable("review", "");
                queryString = "for $review in //movie/title[text()='" + title + "']/../review " +
                              "return update replace $review with <review>" + review + "</review>";
                service.query(queryString);
            }
            
            col.setProperty(OutputKeys.INDENT, "no");
            res = (XMLResource)col.getResource("movies.xml");
            

            resNode = res.getContentAsDOM();

            doc = (Document) resNode;
            
        }
        catch(Exception e)
        {
            System.err.println("Error in document " + e);
        }
        
        DOMSource origDocSource = new DOMSource(doc);
        
        try
        {
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            StreamSource stylesheet = new StreamSource(XslFile);
            
            Transformer transformer = transformerFactory.newTransformer(stylesheet);
            transformer.setParameter("vPageTitle","The Movies Of Steven Spielberg");
            transformer.transform(origDocSource, new StreamResult(out));
        }
        catch (Exception e) 
        {
            System.err.println("Encountered Exception" + e.getMessage());
            e.printStackTrace(out);
        } finally 
        {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    
}
