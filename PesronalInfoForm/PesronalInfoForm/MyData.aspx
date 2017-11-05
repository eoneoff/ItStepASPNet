<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyData.aspx.cs" Inherits="PesronalInfoForm.MyData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" method="post" action="MyDataView.aspx" runat="server">
        <div>
            <table>
                <tr>
                    <td>Фамилия</td>
                    <td><input type="text" id="FamilyName" runat="server"/></td>
                </tr>
                <tr>
                    <td>Имя</td>
                    <td><input type="text" id="FirstName" runat="server" /></td>
                </tr>
                <tr>
                    <td>Отчество</td>
                    <td><input type="text" id="Patronim" runat="server" /></td>
                </tr>
            </table>
            Пол
            <br />
            <input type="radio" value="male" name="sex" runat="server" />
            Мужской
            &nbsp;&nbsp;&nbsp;
            <input type="radio" value="female" name="sex" runat="server"/>
            Женский
            <br /><br />
            <input type="submit" value="Отправить" runat="server" />
        </div>
    </form>
</body>
</html>
