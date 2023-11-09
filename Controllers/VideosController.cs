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
    public class VideosController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        // GET: Videos
        public ActionResult Index()
        {
            return View(db.Videos.ToList());
        }

        // GET: Videos
        public ActionResult QuanLy()
        {
            if (Session["User"] == null) return RedirectToAction("Login", "Home");
            return View(db.Videos.ToList());
        }

        // GET: Videos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // GET: Videos/Create
        public ActionResult Create()
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            return View();
        }

        // POST: Videos/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TieuDe,DuongDan,MoTa,TrangThai")] Video video, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.Videos.Add(video);
                db.SaveChanges();
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\Video\\{video.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Video
                    video.DuongDan = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(video).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLy");
            }

            return View(video);
        }

        // GET: Videos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: Videos/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TieuDe,DuongDan,MoTa,TrangThai")] Video video, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\Video\\{video.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Video
                    video.DuongDan = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(video).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("QuanLy");
            }
            return View(video);
        }

        // GET: Videos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (Session["User"] == null) return RedirectToAction("Index");
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Video video = db.Videos.Find(id);
            if (video == null)
            {
                return HttpNotFound();
            }
            return View(video);
        }

        // POST: Videos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Video video = db.Videos.Find(id);
            db.Videos.Remove(video);
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
