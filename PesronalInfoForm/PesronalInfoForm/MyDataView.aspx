<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyDataView.aspx.cs" Inherits="PesronalInfoForm.MyDataView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Ваши данные</title>
    <style>
        #form1
        {
            background-color:cornflowerblue;
            width:300px;
            margin:10px;
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Фамилия</td>
                    <td><asp:Label ID="FamilyNameLabel" Text="Нет данных" runat="server" /></td>
                </tr>
                <tr>
                    <td>Имя</td>
                    <td><asp:Label ID="FirstNameLabel" Text="Нет данных" runat="server" /></td>
                </tr>
                <tr>
                    <td>Отчество</td>
                    <td><asp:Label ID="PatronimLabel" Text="Нет данных" runat="server" /></td>
                </tr>
                <tr>
                    <td>Пол</td>
                    <td><asp:Label ID="SexLabel" Text="Нет данных" runat="server" /></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
