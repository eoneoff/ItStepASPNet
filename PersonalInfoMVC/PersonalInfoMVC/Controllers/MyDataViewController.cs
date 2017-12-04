using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PersonalInfoMVC.Models;

namespace PersonalInfoMVC.Controllers
{
    public class MyDataViewController : Controller
    {
        // GET: MyDataView
        public ActionResult Index()
        {
            Person person = new Person();
            return View(person);
        }

        [HttpPost]
        public ActionResult Index (Person person)
        {
            return View(person);
        }
    }
}