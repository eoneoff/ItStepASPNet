using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PersonalInfoMVC.Controllers
{
    public class MyDataController : Controller
    {
        string[] cities = { "Киев", "Чернигов", "Харьков", "Львов", "Полтава", "Сумы", "Одесса" };
        string[] hobbies = { "Туризм", "Музыка", "Футбол", "Рисование", "Кино", "Танцы" };

        // GET: MyData
        public ActionResult Index()
        {
            ViewBag.Cities = new SelectList(cities);
            ViewBag.Hobbies = new MultiSelectList(hobbies);
            return View();
        }
    }
}