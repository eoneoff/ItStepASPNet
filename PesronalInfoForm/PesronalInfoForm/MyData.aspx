<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyData.aspx.cs" Inherits="PesronalInfoForm.MyData" %>

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
            <asp:TextBox ID="FamilyNameTextBox" runat="server" />
            <br /><br />
            Имя
            <asp:TextBox ID="FirstNameTextBox" runat="server" />
            <br /><br />
            Отчество 
            <asp:TextBox ID="PatronimTextBox" runat="server" />
            <br /><br />
            Пол
            <br />
            <asp:RadioButton ID="MaleRadioButton" Text="Мужской" GroupName="Sex" runat="server" />
            <asp:RadioButton ID="FemaleRadioButton" Text="Женский" GroupName="Sex" runat="server" />
            <br /><br />
            <asp:Button ID="SendButton" Text="Отправить" OnClick="SendButton_Click" runat="server" />
        </div>
    </form>
</body>
</html>
