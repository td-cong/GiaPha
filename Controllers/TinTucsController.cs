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
    public class TinTucsController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        // GET: TinTucs
        public ActionResult QuanLy()
        {
            var tinTucs = db.TinTucs.Include(t => t.LoaiTinTuc);
            return View(tinTucs.ToList());
        }

        // GET: TinTucs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // GET: TinTucs/Create

        public ActionResult Create()
        {
            ViewBag.IdLoaiTinTuc = new SelectList(db.LoaiTinTucs, "ID", "TenLoaiTinTuc");
            return View();
        }

        // POST: TinTucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TinTuc1,IdLoaiTinTuc,TieuDe,NoiDung,TacGia")] TinTuc tinTuc)
        {
            if (ModelState.IsValid)
            {
                db.TinTucs.Add(tinTuc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLoaiTinTuc = new SelectList(db.LoaiTinTucs, "ID", "TenLoaiTinTuc", tinTuc.IdLoaiTinTuc);
            return View(tinTuc);
        }

        // GET: TinTucs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLoaiTinTuc = new SelectList(db.LoaiTinTucs, "ID", "TenLoaiTinTuc", tinTuc.IdLoaiTinTuc);
            return View(tinTuc);
        }

        // POST: TinTucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TinTuc1,IdLoaiTinTuc,TieuDe,NoiDung,TacGia")] TinTuc tinTuc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tinTuc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLoaiTinTuc = new SelectList(db.LoaiTinTucs, "ID", "TenLoaiTinTuc", tinTuc.IdLoaiTinTuc);
            return View(tinTuc);
        }

        // GET: TinTucs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // POST: TinTucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinTuc tinTuc = db.TinTucs.Find(id);
            db.TinTucs.Remove(tinTuc);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Index()
        {
            TinTuc tinTuc = db.TinTucs.FirstOrDefault();
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
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
