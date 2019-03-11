<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jsonjs.aspx.cs" Inherits="test1.jsonjs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script>
        var xhttp = new XMLHttpRequest();
        //xhttp.open('GET', 'https://learnwebcode.github.io/json-example/animals-1.json');
        xhttp.open('GET','data.json')
        xhttp.onload = function () {
            //console.log(xhttp.responseText);
            var javaobj = xhttp.responseText;
            document.getElementById('list').innerHTML = javaobj;
        };
        xhttp.send();

    </script>
    <div id="list"></div>
</body>
</html>
