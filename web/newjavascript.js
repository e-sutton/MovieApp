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
					$('#table1 tr td').each(function(index, tr) {
				    if ( $(tr).text() == t ) {
				    //find index of tr
				    var index1 = $(this).index();
				    alert(index1);
				        //alert("Film  = " + t + " year = " + $('#table1 tr:nth-child(row_index) td:nth-child(2)').text());
				    }
				})
				}
