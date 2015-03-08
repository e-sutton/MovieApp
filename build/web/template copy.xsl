<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:param name="vPlot"></xsl:param>
	<xsl:template match="/">
		<html>
			<head><title>Movie App</title>
			<!--<xsl:text disable-output-escaping="yes">-->
			<script src="jquery-2.1.1.min.js" type="text/javascript"></script>
			<script type="text/javascript">
                        $(document).ready
				function clickme(){
     		 		$('#table1').hide();
				}

				function showme(){
					$('#table1').show();
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
                                        $('#resultTbl').html('Title: ' + t + ', Year Released: ' + year + ', Writer: ' + writer + ', Plot: ' + plot + ', Producer 1: ' + prod1 + ', Producer 2: ' + prod2 + ', Lead Actor: ' + lead);
				    }
				})
				}
                           
			</script>
		<!--</xsl:text>-->
			</head>
			<body onload="clickme()">
				<h1 align="center">Movies</h1>
				<p>
					</p>
						<p align="center">The Movies of director: <xsl:apply-templates select="//director"/></p>
						<br/><br/>
                                                    <div class="carousel">
                                                            <a class="prev"></a>
                                                            <ul>
                                                                <li><img src="img/CEOTTK_1.jpg" title="Close Encounters Of The Third Kind" onmouseover="getTitle(title)"/></li>
								<li><img src="img/jaws_1.jpg" title="Jaws" onmouseover="getTitle(title)"/></li>

                                                            </ul>
                                                            <a class="next"></a>
                                                    </div>

						<br/>
						Movie Title From XML: <div id="film"></div>
						<br/><br/>
						<input type="button" value="Hide me!" onclick="clickme()"/><br/>
						<input type="button" value="Show me!" onclick="showme()"/><br/>
						<input type="button" value="Show 1 row!" onclick="showtwo()"/><br/>
						<div id="resultTbl"></div>
						<p>
							 <table id="table1" width="1000" border="1" align="center" > 
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
							 	</tr> 
							 	<xsl:for-each select="//movie" > 
							 		<!--<xsl:sort select="medals/gold" order="descending"/>--> 
							 		<tr> 
							 			<td> <xsl:value-of select="./title" /> </td> 
							 			<td> <xsl:value-of select="./year" /> </td> 
							 			<td> <xsl:value-of select="./writer" /> </td><td> 
							 			<xsl:value-of select="./plot" /> </td> 
							 			<td> <xsl:value-of select="./producers/producer[@id=1]" /> </td> 
							 			<td><xsl:value-of select="./producers/producer[@id=2]"/></td>
							 			<td><xsl:value-of select="./actors/actor[@id=1]"/>
							 			</td>
							 			<td><xsl:value-of select="$vPlot"/></td>

							 		</tr> 
							 		</xsl:for-each> 
							 		</table>
							 		
						
						</p>
				</body>
			</html>
		</xsl:template>

			
</xsl:transform>



