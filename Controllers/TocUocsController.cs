using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GiaPha.Models;

namespace GiaPha.Controllers
{
    public class TocUocsController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        // GET: TocUocs
        public ActionResult Index()
        {
            return View(db.TocUocs.ToList());
        }

        // GET: TocUocs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TocUoc tocUoc = db.TocUocs.Find(id);
            if (tocUoc == null)
            {
                return HttpNotFound();
            }
            return View(tocUoc);
        }

        // GET: TocUocs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TocUocs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TocUoc1")] TocUoc tocUoc)
        {
            if (ModelState.IsValid)
            {
                db.TocUocs.Add(tocUoc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tocUoc);
        }

        // GET: TocUocs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TocUoc tocUoc = db.TocUocs.Find(id);
            if (tocUoc == null)
            {
                return HttpNotFound();
            }
            return View(tocUoc);
        }

        // POST: TocUocs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TocUoc1")] TocUoc tocUoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tocUoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tocUoc);
        }

        // GET: TocUocs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TocUoc tocUoc = db.TocUocs.Find(id);
            if (tocUoc == null)
            {
                return HttpNotFound();
            }
            return View(tocUoc);
        }

        // POST: TocUocs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TocUoc tocUoc = db.TocUocs.Find(id);
            db.TocUocs.Remove(tocUoc);
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
