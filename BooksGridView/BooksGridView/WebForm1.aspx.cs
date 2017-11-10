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
        public static DropDownList list;
        public int selectedBookId;
        booksEntities db;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                db = new booksEntities();
                var cathegories = db.Spr_kategory.ToList();
                Categories.DataSource = cathegories;
                Categories.DataTextField = "Category";
                Categories.DataValueField = "Id";
                Categories.DataBind();
                Categories.Items.Insert(0, "Выберите категорию");
                Categories.Items.FindByText(String.Empty).Text = "Без категории";
            }
            list = Categories;
            BooksByCategory.DataSource = BooksByCategoryDS;
            BooksByCategory.DataBind();
        }

        public static IQueryable<books_new> GetBooksByCathegory(IQueryable<books_new> books)
        {
            if (list.Text == "Выберите категорию")
                return (from b in books
                        where b.kategory_id==-1
                        select b);
            if (list.Text == "Без категории")
                return (from b in books
                        where b.Spr_kategory == null
                        select b);

            int categoryId = Int32.Parse(list.SelectedValue);

            return (from b in books
                    where b.kategory_id == categoryId
                    select b);
        }

        protected void Categories_SelectedIndexChanged(object sender, EventArgs e)
        {

            BooksByCategory.SelectedIndex = -1;
        }
    }
}