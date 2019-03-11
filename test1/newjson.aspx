<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newjson.aspx.cs" Inherits="test1.newjson" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">


  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <title>Hello, world!</title>
  </head>
  <body>
    
      <div class="container">
         <div class="flightstatus">
          <table class="table table-bordered table-striped table-hover" id="etable" >
              <thead>
                  <tr>
                      <th>ID</th>
                      <th>NAME</th>
                      <th>EMAIL</th>
                      <th>PHONE</th>
                  </tr>
              </thead>
              <tbody>

              </tbody>
          </table>
        </div>
      </div>
    
      <script>
          //$(document).ready(function ()
          //{
          //    $.getJSON("data.json", function (data) {
          //        var item='';
          //        $.echo (data, function (key, val) {
                   
          //            item += '<tr>';
          //            item += '<td>' + val.id + '</td>';
          //            item += '<td>' + val.name + '</td>';
          //            item += '<td>' + val.email + '</td>';
          //            item += '<td>' + val.phone + '</td>';
          //            item += '</tr>';
          //        });
          //        //$("<tbody/>", { html: item.json("") }).appendTo("table");
          //        $('#etable').append(item);
          //    });
          //});

      </script>

       <script>
           var xhttp = new XMLHttpRequest();
           xhttp.onreadystatechange = function ()
           {
               if (xhttp.readyState === 4)
               {
                   var flight = JSON.parse(xhttp.responseText);
                   var item = '';
                   for (var i = 0; i < flight.length; i++)
                   {
                       item += '<tr>';
                       item += '<td>' + flight[i].id + '</td>';
                       item += '<td>' + flight[i].name + '</td>';
                       item += '<td>' + flight[i].email + '</td>';
                       item += '<td>' + flight[i].phone + '</td>';
                       item += '</tr>';
                   }
                   document.querySelector('.flightstatus tbody').innerHTML = item;
               }
           }
           xhttp.open('GET', 'data.json');
           xhttp.send();

    </script>
      
  </body>
</html>