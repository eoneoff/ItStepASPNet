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
        booksEntities db = new booksEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                var cathegories = db.Spr_kategory.ToList();
                Categories.DataSource = cathegories;
                Categories.DataTextField = "Category";
                Categories.DataValueField = "Id";
                Categories.DataBind();
                Categories.Items.Insert(0, "Выберите категорию");
                Categories.Items.FindByText(String.Empty).Text = "Без категории";
            }
            Session["Category"]=Categories;
            RefreshBooks();
        }

        public static IQueryable<books_new> GetBooksByCathegory(IQueryable<books_new> books)
        {
            DropDownList list = HttpContext.Current.Session["Category"] as DropDownList;
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

        protected void BookView_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            int id  = (from b in db.books_new select new { id = b.N }).Max(i=>i.id)+1;
            e.Values["N"] = id;
            DateTime date = (DateTime)e.Values["Date"];
            if (date < DateTime.Today - TimeSpan.FromDays(36500))
                e.Values["Date"] = null;
        }

        private void RefreshBooks()
        {
            BooksByCategory.DataSource = BooksByCategoryDS;
            BooksByCategory.DataBind();
        }

        protected void BookView_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            RefreshBooks();
        }

        protected void BookView_ItemCreated(object sender, EventArgs e)
        {
            RefreshBooks();
        }

        protected void BookView_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            RefreshBooks();
        }
    }
}