<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDataView.aspx.cs" Inherits="PesronalInfoForm.MyDataView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Фамилия
            <asp:Label ID="FamilyNameLabel" Text="Нет данных" runat="server" />
            <br /><br />
            Имя
            <asp:Label ID="FirstNameLabel" Text="Нет данных" runat="server" />
            <br /><br />
            Отчество
            <asp:Label ID="PatronimLabel" Text="Нет данных" runat="server" />
            <br /><br />
            Пол
            <asp:Label ID="SexLabel" Text="Нет данных" runat="server" />
        </div>
    </form>
</body>
</html>
