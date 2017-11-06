<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BooksGridView.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Каталог книг</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList ID="Categories" runat="server" AutoPostBack="true"/>
        </div>
    </form>
</body>
</html>
