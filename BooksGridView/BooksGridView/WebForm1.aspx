<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="BooksGridView.WebForm1" %>

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
        <div style="display:inline-block; float:left;">
            <asp:DropDownList ID="Categories" runat="server" AutoPostBack="true" Width="330px" />
            <br/><br />            
            <asp:GridView ID="BooksByCategory" runat="server"
                AutoGenerateColumns="false" DataKeyNames="N">
                <Columns>
                    <asp:ButtonField ButtonType="Link" CommandName="Select" DataTextField="N" HeaderText="Id"/>
                    <asp:BoundField DataField="Name" HeaderText="Название" ItemStyle-Width="300px" />
                </Columns>
                <SelectedRowStyle 
                    backcolor="Blue"
                    forecolor="White"/>
            </asp:GridView>
        </div>
        <div style="display:inline-block;float:left;margin:0px 20px">
            <asp:DetailsView ID="SelectedBook" runat="server"
                DataSourceID="SelectedBookDS">
            </asp:DetailsView>
        </div>
        
        <asp:EntityDataSource ID="SelectedBookDS" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="False" EntitySetName="books_new"
            EnableInsert="true" EnableUpdate="true" EnableDelete="true"
            Where="it.N=@N"
            Include="Spr_format, Spr_izd, Spr_themes">
            <WhereParameters>
                <asp:ControlParameter ControlID="BooksByCategory" DbType="Int32" Name="N"
                    PropertyName="SelectedValue"/>
            </WhereParameters>
        </asp:EntityDataSource>
        
        <asp:EntityDataSource ID="BooksByCategoryDS" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="False" EntitySetName="books_new">
            </asp:EntityDataSource>
            <asp:QueryExtender ID="CategorySelectorExtender" runat="server"
                TargetControlID="BooksByCategoryDS">
                <asp:MethodExpression TypeName="WebForm1" MethodName="GetBooksByCathegory"/>
            </asp:QueryExtender>
        <asp:EntityDataSource ID="Izd" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="false" EntitySetName="Spr_izd"/>
        <asp:EntityDataSource ID="Format" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="false" EntitySetName="Spr_format"/>
        <asp:EntityDataSource ID="Theme" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="false" EntitySetName="Spr_themes"/>
        <asp:EntityDataSource ID="Category" runat="server"
            ConnectionString="name=booksEntities" DefaultContainerName="booksEntities"
            EnableFlattening="false" EntitySetName="Spr_kategory"/>
    </form>
</body>
</html>
