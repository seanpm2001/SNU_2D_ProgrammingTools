 : make-html ( string -- xml )
    dup
    <XML
        <html>
            <head><title><-></title></head>
            <body><h1><-></h1></body>
        </html>
    XML> ;

