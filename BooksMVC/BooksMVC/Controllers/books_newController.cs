using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BooksMVC.Models;

namespace BooksMVC.Controllers
{
    public class books_newController : Controller
    {
        private booksEntities db = new booksEntities();

        // GET: books_new
        public ActionResult Index()
        {
            var books_new = db.books_new.Include(b => b.Spr_format).Include(b => b.Spr_izd).Include(b => b.Spr_kategory).Include(b => b.Spr_themes);
            return View(books_new.ToList());
        }

        // GET: books_new/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            books_new books_new = db.books_new.Find(id);
            if (books_new == null)
            {
                return HttpNotFound();
            }
            return View(books_new);
        }

        // GET: books_new/Create
        public ActionResult Create()
        {
            ViewBag.format_id = new SelectList(db.Spr_format, "id", "Format");
            ViewBag.izd_id = new SelectList(db.Spr_izd, "id", "Izd");
            ViewBag.kategory_id = new SelectList(db.Spr_kategory, "Id", "Category");
            ViewBag.themes_id = new SelectList(db.Spr_themes, "id", "Themes");
            ViewBag.N = db.books_new.Select(b => b.N).Max()+1;
            return View();
        }

        // POST: books_new/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Code,New,Name,Price,Pages,Date,Pressrun,izd_id,format_id,themes_id,kategory_id")] books_new books_new)
        {
            if (ModelState.IsValid)
            {
                books_new.N = db.books_new.Select(b => b.N).Max() + 1;
                db.books_new.Add(books_new);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.format_id = new SelectList(db.Spr_format, "id", "Format", books_new.format_id);
            ViewBag.izd_id = new SelectList(db.Spr_izd, "id", "Izd", books_new.izd_id);
            ViewBag.kategory_id = new SelectList(db.Spr_kategory, "Id", "Category", books_new.kategory_id);
            ViewBag.themes_id = new SelectList(db.Spr_themes, "id", "Themes", books_new.themes_id);
            return View(books_new);
        }

        // GET: books_new/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            books_new books_new = db.books_new.Find(id);
            if (books_new == null)
            {
                return HttpNotFound();
            }
            ViewBag.format_id = new SelectList(db.Spr_format, "id", "Format", books_new.format_id);
            ViewBag.izd_id = new SelectList(db.Spr_izd, "id", "Izd", books_new.izd_id);
            ViewBag.kategory_id = new SelectList(db.Spr_kategory, "Id", "Category", books_new.kategory_id);
            ViewBag.themes_id = new SelectList(db.Spr_themes, "id", "Themes", books_new.themes_id);
            return View(books_new);
        }

        // POST: books_new/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "N,Code,New,Name,Price,Pages,Date,Pressrun,izd_id,format_id,themes_id,kategory_id")] books_new books_new)
        {
            if (ModelState.IsValid)
            {
                db.Entry(books_new).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.format_id = new SelectList(db.Spr_format, "id", "Format", books_new.format_id);
            ViewBag.izd_id = new SelectList(db.Spr_izd, "id", "Izd", books_new.izd_id);
            ViewBag.kategory_id = new SelectList(db.Spr_kategory, "Id", "Category", books_new.kategory_id);
            ViewBag.themes_id = new SelectList(db.Spr_themes, "id", "Themes", books_new.themes_id);
            return View(books_new);
        }

        // GET: books_new/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            books_new books_new = db.books_new.Find(id);
            if (books_new == null)
            {
                return HttpNotFound();
            }
            return View(books_new);
        }

        // POST: books_new/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            books_new books_new = db.books_new.Find(id);
            db.books_new.Remove(books_new);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
