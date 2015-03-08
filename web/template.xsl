<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:param name="vPageTitle"></xsl:param>
    <xsl:template match="/">
        <html>
            <head>
                <title>Movie App</title>
                <!--<xsl:text disable-output-escaping="yes">-->
                <script src="jquery-2.1.1.min.js" type="text/javascript"></script>
                <link type="text/css" rel="stylesheet" href="bootstrap.css"/>
                <link type="text/css" rel="stylesheet" href="style.css"/>
                <script src="bootstrap.js"></script>
                <script src="bootstrap.min.js"></script>
                <script type="text/javascript">
                    var x = false;
                    if(window.XMLHttpRequest)
                    {
                    x = new XMLHttpRequest();
                    }
                    else if(window.ActiveXObject)
                    {
                    x = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                                    
                    function clickme(){
                    $('#table1').hide();
                    }

                    function showme(){
                    $('#table1').show();
                    }
                                    
                    function getServerTime(){
                    if(x)
                    {
                    x.open("GET","getTime.jsp");
                    x.onreadystatechange = function (){
                    if(x.readyState == 4 || x.status == 200)
                    {
                    $('#time').html(x.responseText);
                    }
                    }
                    x.send(null);
                    }
                                        
                    }

                    function getTitle(title){
                    var t = title;
                    //alert("title= " + t);
                    $('#film').text(t);
                    var film;
                    $('#table1 tr td').each(function(index, tr) {
                    if ( $(tr).text() == t ) {
                    //find index of tr
                    var rowIndex = $(this).closest('tr').index();
                    //alert(rowIndex);
                    //increment row by 1 to ensure correct data got
                    rowIndex = rowIndex + 1;
                    //alert("Film  = " + t + " year = " + $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(2)').text());
                    var year = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(2)').text();
                    var writer = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(3)').text();
                    var plot = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(4)').text();
                    var prod1 = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(5)').text();
                    var prod2 = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(6)').text();
                    var lead = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(7)').text();
                    var review = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(8)').text();
                    var wwGross = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(9)').text();
                    var domGross = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(10)').text();
                    var forGross = $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(11)').text();
                    //$('#testing').html('Title: ' + t + ', Year Released: ' + year + ', Writer: ' + writer + ', Plot: ' + plot + ', Producer 1: ' + prod1 + ', Producer 2: ' + prod2 + ', Lead Actor: ' + lead);
                    $('#year').html('<b>Year: </b>' + year);
                    $('#actors').html('<b>Starring: </b>' + lead);
                    $('#producer1').html('<b>Producer(s): </b>' + prod1 + ', ' + prod2);
                    //$('#producer2').html(prod2);
                    $('#writer').html('<b>Writer(s): </b>' + writer);
                    $('#movieImage').html('<img src="images/' + t + '.jpg"/>');
                    $('#moviePlot').html(plot);
                    $('#movieTitle').html('<b>Title: </b>' + t);
                    $('#input2').val(t);
                    $('#movieReview').html('<b>Review: </b>' + review);
                    $('#domGross').html('<b>Domestic Gross: </b>' + domGross);
                    $('#forGross').html('<b>Foreign Gross: </b>' + forGross);
                    $('#overallGross').html('<b>Domestic Gross: </b>' + wwGross);
                                        
                    }
                    })
                    }
                           
                </script>
                <!--</xsl:text>-->
            </head>
            <body onload="clickme()">
				
                <div class="container-fluid">
                    <header>
                        <div class="row-fluid">
                            <div class="span12">
                                <ul class="nav nav-pills">
                                    <li class="active">
                                        <a href="index.html">
                                            <b>Movies</b>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="about.html">
                                            <b>Not used</b>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>	
                    </header>
                    <div class="jumbotron">
                        <div>
                            <div id ="jt1">
                                <img id="jtImg" src="images/steven_spielberg_1.jpg"/>
                            </div>
                            <div id="jumbotext1">
                                <h1>
                                    <xsl:value-of select="$vPageTitle"/>
                                </h1>
                            </div>
                            <div id ="jt2">
                                <img id="jtImg" src="images/steven_spielberg_2.jpg"/>
                            </div>			
                        </div>
                    </div>
			
                    <div id="imagesAll">
                        <div class="item active">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Jaws.jpg" title="Jaws" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Close Encounters Of The Third Kind.jpg" title="Close Encounters Of The Third Kind" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Raiders Of The Lost Ark.jpg" title="Raiders Of The Lost Ark" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/E.T. The Extra-Terrestrial.jpg" title="E.T. The Extra-Terrestrial" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Indiana Jones and the Temple of Doom.jpg" title="Indiana Jones and the Temple of Doom" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/The Color Purple.jpg" title="The Color Purple" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Empire of the Sun.jpg" title="Empire of the Sun" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Indiana Jones and the Last Crusade.jpg" title="Indiana Jones and the Last Crusade" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Hook.jpg" title="Hook" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                        <div class="item">
                            <div class="col-md-4">
                                <a href="#">
                                    <img src="images/Jurassic Park.jpg" title="Jurassic Park" onmouseover="getTitle(title); getServerTime()" class="img-responsive"/>
                                </a>
                            </div>
                        </div>
                    </div>
			
                    <div id="movieDetails">
                        <div id="movieImage" class="img-responsive">
                            <img src="images/Jaws.jpg"/>
                        </div>  
                        <div id="movieDetails1">
                            <br/>
                            <b>
                                <div id="movieTitle">Title: </div>
                            </b>
                            <br/>
                            <p>
                                <b>
                                    <div id="year">Year: </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id="actors">Starring: </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id="producer1">Producer(s): </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id="writer">Writer(s): </div>
                                </b>
                            </p>
                            <br/>
                            <br/>
                            <br/>
                        </div>
                        <div id="movieDetails2">
                            <br/>
                            <br/>
                            <p>
                                <b>
                                    <div id = "domGross">Domestic Gross: </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id = "forGross">Foreign Gross: </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id = "overallGross">Overall Box Office Gross: </div>
                                </b>
                            </p>
                            <br/>
                            <p>
                                <b>
                                    <div id="movieReview">Review: </div>
                                </b>
                            </p>
                            <form method="get" action="ReviewServlet">
                                <input type="text" name="review" value=""/>
                                <input type="hidden" name="title" id="input2" value=""/>
                                <br/>
                                <input type="submit" value="Submit"/>
                            </form>
                        </div>
                        <div id="movieDetails3">
                            <br/>
                            <br/>
                            <div align="center" id="moviePlot"></div>
                            
                        </div>
                    </div> 
                    <div align="center" id="time"></div>               
                    <footer>
                        <div class="row-fluid">
                            <div class="span12">
                                <div id="footertext">
                                    <p>
                                        <b>Links: </b> 
                                        <a href="http://www.imdb.com/name/nm0000229/">
                                            <span class="label label-info">IMDB</span>
                                        </a> 
                                        <a href="http://www.biography.com/people/steven-spielberg-9490621">
                                            <span class="label label-danger">Biography</span>
                                        </a> 
                                        <a href="http://en.wikipedia.org/wiki/Steven_Spielberg">
                                            <span class="label label-success">Wikipedia</span>
                                        </a> 
                                        <a href="http://www.dreamworksstudios.com/">
                                            <span class="label label-warning">Dreamworks SKG</span>
                                        </a>
                                        <b> | 2014 Web Development Project, Semester 1. All rights reserved.</b>
                                    </p>	
                                </div>	
                            </div>
                        </div>
                    </footer>	
                </div> 
                            
                            
                <table id="table1" width="1500" border="1" align="center" > 
                    <tr bgcolor = "#cccccc" > 
                        <td id="tr1" width="100"> 
                            <b>Title</b> 
                        </td> 
                        <td width="100"> 
                            <b>Year</b> 
                        </td> 
                        <td width="100"> 
                            <b>Writer</b> 
                        </td> 
                        <td width="100"> 
                            <b>Plot</b> 
                        </td> 
                        <td width="100"> 
                            <b>Producer 1</b> 
                        </td> 
                        <td width="100"> 
                            <b>Producer 2</b> 
                        </td> 
                        <td width="100"> 
                            <b>Lead Actor</b> 
                        </td> 
                        <td width="100"> 
                            <b>Review</b> 
                        </td> 
                        <td width="100"> 
                            <b>WorldWide Gross</b> 
                        </td> 
                        <td width="100"> 
                            <b>Domestic Gross</b> 
                        </td> 
                        <td width="100"> 
                            <b>Foreign Gross</b> 
                        </td> 
                    </tr> 
                    <xsl:for-each select="//movie" > 
                        <!--<xsl:sort select="medals/gold" order="descending"/>--> 
                        <tr> 
                            <td> 
                                <xsl:value-of select="./title" /> 
                            </td> 
                            <td> 
                                <xsl:value-of select="./year" /> 
                            </td> 
                            <td> 
                                <xsl:value-of select="./writer" /> 
                            </td>
                            <td> 
                                <xsl:value-of select="./plot" /> 
                            </td> 
                            <td> 
                                <xsl:value-of select="./producers/producer[@id=1]" /> 
                            </td> 
                            <td>
                                <xsl:value-of select="./producers/producer[@id=2]"/>
                            </td>
                            <td>
                                <xsl:value-of select="./actors/actor[@id=1]"/>
                            </td>
                            <td>
                                <xsl:value-of select="./review"/>
                            </td>
                            <td>
                                <xsl:value-of select="./wWGross"/>
                            </td>
                            <td>
                                <xsl:value-of select="./domGross"/>
                            </td>
                            <td>
                                <xsl:value-of select="./forGross"/>
                            </td>
                        </tr> 
                    </xsl:for-each> 
                </table>						
            </body>
        </html>
    </xsl:template>			
</xsl:transform>



