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
    public class AnhsController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        // GET: Anhs
        public ActionResult Index()
        {
            return View(db.Anhs.ToList());
        }
        
        // GET: Anhs
        public ActionResult QuanLy()
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            return View(db.Anhs.ToList());
        }

        // GET: Anhs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Anh anh = db.Anhs.Find(id);
            if (anh == null)
            {
                return HttpNotFound();
            }
            return View(anh);
        }

        // GET: Anhs/Create
        public ActionResult Create()
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            return View();
        }

        // POST: Anhs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TieuDe,DuongDan,MoTa,TrangThai")] Anh anh, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Anhs.Add(anh);
                db.SaveChanges();
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\Anh\\{anh.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Avt
                    anh.DuongDan = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(anh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLy");
            }

            return View(anh);
        }

        // GET: Anhs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Anh anh = db.Anhs.Find(id);
            if (anh == null)
            {
                return HttpNotFound();
            }
            return View(anh);
        }

        // POST: Anhs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TieuDe,DuongDan,MoTa,TrangThai")] Anh anh, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\Anh\\{anh.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Avt
                    anh.DuongDan = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(anh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLy");
            }
            return View(anh);
        }

        // GET: Anhs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Anh anh = db.Anhs.Find(id);
            if (anh == null)
            {
                return HttpNotFound();
            }
            return View(anh);
        }

        // POST: Anhs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Anh anh = db.Anhs.Find(id);
            db.Anhs.Remove(anh);
            db.SaveChanges();
            return RedirectToAction("QuanLy");
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
