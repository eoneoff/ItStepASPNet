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
            color:yellow;
        }
        .section
        {
            display:inline-block;
            float:left;
            margin:0px 10px;
            padding:10px;
            background-color:cornflowerblue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="section">
            <asp:DropDownList ID="Categories" runat="server" AutoPostBack="true" Width="330px" OnSelectedIndexChanged="Categories_SelectedIndexChanged"/>
            <br/><br />
            <asp:UpdatePanel ID="CategoryGridUpdatePanel" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="BooksByCategory" runat="server"
                        AutoGenerateColumns="false" DataKeyNames="N"  BackColor="White">
                        <Columns>
                            <asp:ButtonField ButtonType="Link" CommandName="Select" DataTextField="N" HeaderText="Id"/>
                            <asp:BoundField DataField="Name" HeaderText="Название" ItemStyle-Width="300px" />
                        </Columns>
                        <SelectedRowStyle 
                            backcolor="Blue"
                            forecolor="White"/>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Categories" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="BookView" EventName="ItemCreated" />
                    <asp:AsyncPostBackTrigger ControlID="BookView" EventName="ItemUpdated" />
                    <asp:AsyncPostBackTrigger ControlID="BookView" EventName="ItemDeleted" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div class="section">
            <asp:FormView ID="BookView" runat="server" Width="330px" DataSourceID="SelectedBookDS"
                DefaultMode="ReadOnly"  DataKeyNames="N" OnItemInserting="BookView_ItemInserting">
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
                        <tr>
                            <td class="label">Новая</td>
                            <td><asp:CheckBox runat="server" ID="NewViewCB" Checked='<%#Eval("New") %>' Enabled="false"/></td>
                        </tr>
                        <tr>
                            <td class="label">Код</td>
                            <td><%#Eval("Code") %></td>
                        </tr>
                        <tr>
                            <td class="label">Цена</td>
                            <td><%#Eval("Price") %></td>
                        </tr>
                        <tr>
                            <td class="label">Страниц</td>
                            <td><%#Eval("Pages") %></td>
                        </tr>
                        <tr>
                            <td class="label">Дата выхода</td>
                            <td><%#Eval("Date","{0:d MMMM yyyy}") %></td>
                        </tr>
                        <tr>
                            <td class="label">Тираж</td>
                            <td><%#Eval("Pressrun") %></td>
                        </tr>
                        <tr>
                            <td class="label">Формат</td>
                            <td><%#Eval("Spr_format.Format") %></td>
                        </tr>
                        <tr>
                            <td class="label">Издательство</td>
                            <td><%#Eval("Spr_izd.Izd") %></td>
                        </tr>
                        <tr>
                            <td class="label">Тема</td>
                            <td><%#Eval("Spr_themes.Themes") %></td>
                        </tr>
                    </table>
                    <asp:Button runat="server" ID="ChangeButton" Text="Изменить" CommandName="Edit"/>
                    <asp:Button runat="server" ID="DeleteButton" Text="Удалить" CommandName="Delete" />
                    <asp:Button runat="server" ID="AddButton" Text="Добавить" CommandName="New" />
                </ItemTemplate>
                <EditItemTemplate>
                    <table>
                        <tr>
                            <td class="label">Id</td>
                            <td><asp:Label ID="id" runat="server" Text='<%#Bind("N") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Название</td>
                            <td><asp:TextBox runat="server" ID="EditName" TextMode="MultiLine" Text='<%#Bind("Name") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Новая</td>
                            <td><asp:CheckBox runat="server" ID="NewEditCB" Checked='<%#Bind("New") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Код</td>
                            <td><asp:TextBox runat="server" ID="EditCode" Text='<%#Bind("Code") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Цена</td>
                            <td><asp:TextBox runat="server" ID="EditPrice" Text='<%#Bind("Price") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Страниц</td>
                            <td><asp:TextBox runat="server" ID="EditPages" TextMode="Number" Text='<%#Bind("Pages") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Дата выхода</td>
                            <td><asp:Calendar ID="EditDate" runat="server" SelectedDate='<%#Bind("Date")%>' VisibleDate='<%#(Eval("Date")==null)?DateTime.Today:Eval("Date") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Тираж</td>
                            <td><asp:TextBox runat="server" ID="EditPressrun" TextMode="Number" Text='<%#Bind("Pressrun") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Формат</td>
                            <td><asp:DropDownList ID="SelectFormat" runat="server" DataSourceID="Format" DataTextField="Format" DataValueField="id"  SelectedValue='<%#Bind("format_id") %>' /></td>
                        </tr>
                        <tr>
                            <td class="label">Издательство</td>
                            <td><asp:DropDownList ID="SelectIzd" runat="server" DataSourceID="Izd" DataTextField="Izd" DataValueField="id"  SelectedValue='<%#Bind("izd_id") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Категория</td>
                            <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Category" DataTextField="Category" DataValueField="id"  SelectedValue='<%#Bind("kategory_id") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Тема</td>
                            <td><asp:DropDownList ID="SelectTheme" runat="server" DataSourceID="Theme" DataTextField="Themes" DataValueField="id"  SelectedValue='<%#Bind("themes_id") %>' /></td>
                        </tr>
                    </table>
                    <asp:Button runat="server" ID="Save" Text="Сохранить" CommandName="Update"/>
                    <asp:Button runat="server" ID="Cancel" Text="Отмена" CommandName="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td class="label">Id</td>
                            <td><asp:Label ID="idInsert" runat="server" Text='<%#Bind("N") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Название</td>
                            <td><asp:TextBox runat="server" ID="EditName" TextMode="MultiLine" Text='<%#Bind("Name") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Новая</td>
                            <td><asp:CheckBox runat="server" ID="NewEditCB" Checked='<%#Bind("New") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Код</td>
                            <td><asp:TextBox runat="server" ID="EditCode" Text='<%#Bind("Code") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Цена</td>
                            <td><asp:TextBox runat="server" ID="EditPrice" Text='<%#Bind("Price") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Страниц</td>
                            <td><asp:TextBox runat="server" ID="EditPages" TextMode="Number" Text='<%#Bind("Pages") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Дата выхода</td>
                            <td><asp:Calendar ID="EditDate" runat="server" SelectedDate='<%#Bind("Date")%>' VisibleDate='<%#(Eval("Date")==null)?DateTime.Today:Eval("Date") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Тираж</td>
                            <td><asp:TextBox runat="server" ID="EditPressrun" TextMode="Number" Text='<%#Bind("Pressrun") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Формат</td>
                            <td><asp:DropDownList ID="SelectFormat" runat="server" DataSourceID="Format" DataTextField="Format" DataValueField="id"  SelectedValue='<%#Bind("format_id") %>' /></td>
                        </tr>
                        <tr>
                            <td class="label">Издательство</td>
                            <td><asp:DropDownList ID="SelectIzd" runat="server" DataSourceID="Izd" DataTextField="Izd" DataValueField="id"  SelectedValue='<%#Bind("izd_id") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Категория</td>
                            <td><asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="Category" DataTextField="Category" DataValueField="id"  SelectedValue='<%#Bind("kategory_id") %>'/></td>
                        </tr>
                        <tr>
                            <td class="label">Тема</td>
                            <td><asp:DropDownList ID="SelectTheme" runat="server" DataSourceID="Theme" DataTextField="Themes" DataValueField="id"  SelectedValue='<%#Bind("themes_id") %>' /></td>
                        </tr>
                    </table>
                    <asp:Button runat="server" ID="Save" Text="Сохранить" CommandName="Insert"/>
                    <asp:Button runat="server" ID="Cancel" Text="Отмена" CommandName="Cancel" />
                </InsertItemTemplate>
                <EmptyDataTemplate>
                    <asp:Button runat="server" ID="AddButton" Text="Добавить" CommandName="New" />
                </EmptyDataTemplate>
            </asp:FormView>
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
