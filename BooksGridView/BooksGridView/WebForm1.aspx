﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BooksGridView.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Каталог книг</title>
    <style>
        .label
        {
            text-align:right;
            vertical-align:top;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FormView ID="BookView" runat="server" Width="330px">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td class="label">Id</td>
                            <td><%#Eval("N") %></td>
                        </tr>
                        <tr>
                            <td class="label">Название</td>
                            <td><%#Eval("Name") %></td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:DropDownList ID="Categories" runat="server" AutoPostBack="true" Width="330px"/>
            <br/><br />            
            <asp:GridView ID="BooksByCategory" runat="server"
                AutoGenerateColumns="false" DataKeyNames="N"
                OnSelectedIndexChanged="BooksByCategory_SelectedIndexChanged">
                <Columns>
                    <asp:ButtonField ButtonType="Link" CommandName="Select" DataTextField="N" HeaderText="Id"/>
                    <asp:BoundField DataField="Name" HeaderText="Название" ItemStyle-Width="300px" />
                </Columns>
                <SelectedRowStyle 
                    backcolor="Blue"
                    forecolor="White"/>
            </asp:GridView>
            <asp:EntityDataSource ID="BooksByCategoryDS" runat="server" ConnectionString="name=booksEntities" DefaultContainerName="booksEntities" EnableFlattening="False" EntitySetName="books_new">
            </asp:EntityDataSource>
            <asp:QueryExtender ID="CategorySelectorExtender" runat="server"
                TargetControlID="BooksByCategoryDS">
                <asp:MethodExpression TypeName="WebForm1" MethodName="GetBooksByCathegory"/>
            </asp:QueryExtender>
        </div>
        
        <asp:EntityDataSource ID="SelectedBookDS" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="False" EntitySetName="books_new"
            Where="it.N=@N" >
            <WhereParameters>
                <asp:ControlParameter ControlID="BooksByCategory" DbType="Int32" Name="N"
                    PropertyName="SelectedValue"/>
            </WhereParameters>
        </asp:EntityDataSource>        
    </form>
</body>
</html>