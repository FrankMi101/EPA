<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridPage.aspx.cs" Inherits="EPA2.EPAsystem.GridPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        :root {
            --dark-green: darkgreen;
            --highlight-green:#ff5454;
        }

        * {
            box-sizing:border-box;
        }
         .signup-form {
             font-family:Arial;
             margin:0px;
             padding-top:2.5rem;
             display:grid;
             grid-auto-rows: 2rem;
             grid-row-gap: 1.5rem;

         }
         .signup-form-title
         {
             text-align:center;
             font-size:1.8rem;
             color:var(--highlight-green);
         }
         .signup-form label
         {
             font-weight:bold;
         }
         .button {
             background-color: var(--dark-green);
             border:2px solid blue;
             border-radius: 8px;
             color:white;

         }
         .signup-form label,
         .signup-form input,
         .signup-form select {
             display:block;
             margin-top: 1rem;
             width:100%;
             height:auto
         }

         .signup-form input:focus,
         .signup-form select:focus{
             outline:none;
             background:#d8f3df;
             border-color: var(--dark-green) ;
         }
         @supports (display: grid)
         {
             .signup-form{

                 display:grid;

                 /*grid-template-columns: 5rem auto fit-content(8rem) ;*/


             }

         }
         @media (min-width: 60rem)
         {
             .signup-form {
                 margin:auto;
                 width:30rem;
                 grid-template-columns: 10rem auto;
                 grid-row-gap: 1.5rem;

             }
             .signup-form-checkbox
             {
                 grid-column:span 2;
             }
             .signup-form-title{
                 grid-column: span 2;
             }

         }
    </style>
</head>
<body>
    <form id="form1" runat="server" class ="signup-form">
        <label for="title" class="signup-title">Title</label>
        <select id="title" class="signup-form-title">
            <option value="mr">Mr.</option>
            <option value="ms">Ms.</option>
        </select>
        <label for ="first-name">First Name</label>
        <input type="text" id="first-name" required="required"  />
        <label for ="last-name">Last Name</label>
        <input type="text" id="last-name" required="required"  />
         <label for ="email">E-mail</label>
        <input type="email" id="email" required="required"  />
         <label for ="password">PassWord</label>
        <input type="password" id="password" required="required"  />

        <div class="signup-form-checkbox">
            <input type="checkbox" id ="agree-terms" required="required"/>
            <label for="agree-term">Agree to <a href="#">Terms @amp; Conditions</a></label>
        </div>
         
        <button type="submit" class="button"> Sign up </button>
    </form>
</body>
</html>
