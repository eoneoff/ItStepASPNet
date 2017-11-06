using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BooksGridView
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        booksEntities db;
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new booksEntities();
            var cathegories = db.Spr_kategory.ToList();
            Categories.DataSource = cathegories;
            if(!IsPostBack)
            {
                Categories.DataTextField = "Category";
                Categories.DataValueField = "Id";
                Categories.DataBind();
                Categories.Items.Insert(0, "Выберите категорию");
                Categories.Items.FindByText(String.Empty).Text = "Без категории";
            }
        }
    }
}