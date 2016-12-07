<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CCSMLogin.aspx.cs" Inherits="CCSMLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
            height: 273px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>




    <table><tr><td>
        <img alt="" class="auto-style1" src="images/completecsmlogo5orangeblue.jpg" />
        </td>
        <td>
            <table><tr><td>UserName:</td><td>
                <asp:TextBox ID="TxtUser" runat="server"></asp:TextBox> </td><td></td></tr>
                <tr><td>Password:</td><td>
                <asp:TextBox ID="TxtPwd" runat="server"></asp:TextBox> </td> <td>
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" OnClick="BtnLogin_Click" /> 
                    </td></tr>
                <tr><td colspan="3"> </td></tr>
                <tr><td colspan="3"> <asp:Label ID="lblError" runat="server" Visible="false" ForeColor="Red" Text="You must have a valid username and password combination to use this site."></asp:Label>
            </td></tr>
            </table>
            </td>
           </tr></table>    
    </div>
    </form>
</body>
</html>
