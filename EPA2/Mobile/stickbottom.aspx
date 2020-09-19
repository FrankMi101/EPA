<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stickbottom.aspx.cs" Inherits="EPA2.Mobile.Stickbottom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        body {
            height: 100%;
        }

        #document {
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        main {
            flex: auto;
        }

        footer {
            flex-shrink: 0;
        }

        /* Other styling elements, that are not necessary for the example */

        * {
            margin: 0;
            font-family: Candara;
        }

        h1, p {
            padding: 20px;
        }

        footer {
            color: white;
            background: url(https://images.unsplash.com/photo-1550795598-717619d32900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=676&q=80);
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

            footer > h1 {
                text-shadow: 1px 1px 4px #00000080;
            }
    </style>
</head>
<body>

    <div id="document">
        <main>
            <h1>Everything apart from the footer goes here</h1>
            <p>Add more text here, to see how the footer responds!</p>
                 <p>Add more text here, to see how the footer responds!</p>
         <p>Add more text here, to see how the footer responds!</p>
             <p>Add more text here, to see how the footer responds!</p>

             <p>Add more text here, to see how the footer responds!</p>
        </main>
        <footer>
            <h1>The footer goes here</h1>
        </footer>
    </div>
</body>
</html>
