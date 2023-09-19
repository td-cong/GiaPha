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
    public class PhaKysController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        // GET: PhaKys
        public ActionResult Index()
        {
            return View(db.PhaKies.ToList());
        }

        // GET: PhaKys/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhaKy phaKy = db.PhaKies.Find(id);
            if (phaKy == null)
            {
                return HttpNotFound();
            }
            return View(phaKy);
        }

        // GET: PhaKys/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PhaKys/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,PhaKy1")] PhaKy phaKy)
        {
            if (ModelState.IsValid)
            {
                db.PhaKies.Add(phaKy);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(phaKy);
        }

        // GET: PhaKys/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhaKy phaKy = db.PhaKies.Find(id);
            if (phaKy == null)
            {
                return HttpNotFound();
            }
            return View(phaKy);
        }

        // POST: PhaKys/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,PhaKy1")] PhaKy phaKy)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phaKy).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(phaKy);
        }

        // GET: PhaKys/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhaKy phaKy = db.PhaKies.Find(id);
            if (phaKy == null)
            {
                return HttpNotFound();
            }
            return View(phaKy);
        }

        // POST: PhaKys/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PhaKy phaKy = db.PhaKies.Find(id);
            db.PhaKies.Remove(phaKy);
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
