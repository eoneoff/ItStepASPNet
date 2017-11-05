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
                Hobbies.DataSource = hobbies;
                Hobbies.DataBind();
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            InsertInCache("FamilyName", FamilyNameTextBox.Text);
            InsertInCache("FirstName", FirstNameTextBox.Text);
            InsertInCache("Patronim", PatronimTextBox.Text);

            if (MaleRadio.Checked)
                InsertInCache("Sex", "Мужской");
            else
                InsertInCache("Sex", "Женский");

            InsertInCache("City", Cities.SelectedValue);

            string hobbies = String.Empty;
            foreach(ListItem hobby in Hobbies.Items)
            {
                if(hobby.Selected)
                    hobbies += hobby.Text + "<br/>";
            }

            InsertInCache("Hobbies", hobbies);

            InsertInCache("BirthDate", BirthDate.SelectedDate.ToString("dd MMMM yyyyг"));

            Response.Redirect("MyDataView.aspx");
        }

        private void InsertInCache(string label, string data)
        {
            Cache.Insert(label, data, null, System.Web.Caching.Cache.NoAbsoluteExpiration, TimeSpan.FromSeconds(30));
        }
    }
}