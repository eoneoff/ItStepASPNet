<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyData.aspx.cs" Inherits="PesronalInfoForm.MyData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Введите данные</title>
    <style>
        #form1
        {
            color:white;
            background-color:cornflowerblue;
            width:300px;
            margin:10px;
            padding:10px;
        }
    </style>
</head>
<body>
    <form id="form1" method="post" runat="server">
        <div>
            <table>
                <tr>
                    <td>Фамилия</td>
                    <td><asp:TextBox ID="FamilyNameTextBox" runat="server"/></td>
                </tr>
                <tr>
                    <td>Имя</td>
                    <td><asp:TextBox ID="FirstNameTextBox" runat="server"/></td>
                </tr>
                <tr>
                    <td>Отчество</td>
                    <td><asp:TextBox ID="PatronimTextBox" runat="server"/></td>
                </tr>
            </table>
            Пол
            <br />
            <asp:RadioButton ID="MaleRadio" Text="Мужской" Checked="true" GroupName="Sex" runat="server"/>
            &nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="FemaleRadio" Text="Женский" GroupName="Sex" runat="server" />
            <br /><br />
            Город
            <asp:DropDownList ID="Cities" runat="server" AutoPostBack="false"/>
            <br /><br />
            Хобби<br />
            <asp:CheckBoxList ID="Hobbies" runat="server" />
            <br />
            Дата рождения
            <asp:Calendar ID="BirthDate" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px"></DayHeaderStyle>

                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF"></NextPrevStyle>

                <OtherMonthDayStyle ForeColor="#999999"></OtherMonthDayStyle>

                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99"></SelectedDayStyle>

                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666"></SelectorStyle>

                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px"></TitleStyle>

                <TodayDayStyle BackColor="#99CCCC" ForeColor="White"></TodayDayStyle>

                <WeekendDayStyle BackColor="#CCCCFF"></WeekendDayStyle>
            </asp:Calendar>
            <br />
            <asp:Button ID="Submit" Text="Отправить" onclick="Submit_Click" runat="server"/>
        </div>
    </form>
</body>
</html>
