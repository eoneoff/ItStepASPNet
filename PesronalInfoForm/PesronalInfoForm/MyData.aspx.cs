using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PesronalInfoForm
{
    public partial class MyData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string[] cities = { "Киев", "Чернигов", "Харьков", "Львов", "Полтава", "Сумы", "Одесса" };
                string[] hobbies = { "Туризм", "Музыка", "Футбол", "Рисование", "Кино", "Танцы" };
                Cities.DataSource = cities;
                Cities.DataBind();
                Cities.Items.Insert(0, "");
                Hobbies.DataSource = hobbies;
                Hobbies.DataBind();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                Session["FamilyName"] = FamilyNameTextBox.Text;
                Session["FirstName"] = FirstNameTextBox.Text;
                Session["Patronim"] = PatronimTextBox.Text;

                if (MaleRadio.Checked)
                    Session["Sex"] = "Мужской";
                else
                    Session["Sex"] = "Женский";

                Session["City"] = Cities.SelectedValue;

                string hobbies = String.Empty;
                foreach (ListItem hobby in Hobbies.Items)
                {
                    if (hobby.Selected)
                        hobbies += hobby.Text + "<br/>";
                }

                Session["Hobby"] = hobbies;

                Session["BirthDate"] = BirthDate.SelectedDate.ToString("dd MMMM yyyyг");

                Response.Redirect("MyDataView.aspx");
            }
        }
    }
}