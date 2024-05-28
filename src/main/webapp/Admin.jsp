<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
        }
        .container-fluid {
    width: 100%;
    padding-right: 7.5px;
    padding-left: 7.5px;
    margin-right: auto;
    margin-left: auto;
}
        .iframe-container {
            width: 50%; 
            padding: 10px; 
            box-sizing: border-box; 
        }
        iframe {
            width: 900px;
            height: 850px; 
            border: none; 
        }
        
        .iframe-container,
        iframe {
            flex: 0 0 auto;
        }
    </style>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@include file="MenuAdmin.jsp"%>
</head>
<body>
    <div class="container-fluid">
        <div class="container">
        <div class="iframe-container">
            <iframe src="grafico1.jsp"></iframe>
        </div>
        <div class="iframe-container">
            <iframe src="grafico2.jsp"></iframe>
        </div>
        <div class="iframe-container">
            <iframe src="grafico3.jsp"></iframe>
        </div>
        <div class="iframe-container">
            <iframe src="grafico4.jsp"></iframe>
        </div>
        </div>
    </div>
</body>
</html>
