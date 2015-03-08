/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

                                function clickme(){
     		 		$('table').hide();
				}

				function showme(){
					$('table').show();
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
                                            alert("Film  = " + t + " year = " + $('#table1 tr:nth-child('+ rowIndex + ') td:nth-child(2)').text());
                                        $('#resultTbl').append('<table><td>Title</td><tr>'+ t +'</tr> </table> ');
                                        var tblstr = "<table border='1'><tr><td>This is a test</td><td>Col2</td></tr></table>";
				    }
				})
				}