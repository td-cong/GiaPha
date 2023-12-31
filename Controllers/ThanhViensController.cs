﻿
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
    public class ThanhViensController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();
        private string serverRootFolderPath = System.Web.HttpContext.Current.Server.MapPath("~/");
        //private string serverRootFolderPath = System.Web.Hosting.HostingEnvironment.MapPath("~/");

        // GET: ThanhViens
        public ActionResult Index()
        {
            if (Session["User"] == null) return RedirectToAction("Login", "Home");
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            return View(db.ThanhViens.ToList());
        }

        // GET: ThanhViens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ThanhVienList = db.ThanhViens.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // GET: ThanhViens/Create
        public ActionResult Create()
        {
            ViewBag.ThanhVienList = db.ThanhViens.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            return View();
        }

        // POST: ThanhViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,PID,HoTen,NamSinh,NamMat,GioiTinh,VoChong,DiaPhuong,LyLich,Avt,IsTruongHo,IsTruongChi")] ThanhVien thanhVien, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.ThanhViens.Add(thanhVien);
                db.SaveChanges();
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\ThanhVien\\{thanhVien.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Avt
                    thanhVien.Avt = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(thanhVien).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(thanhVien);
        }

        // GET: ThanhViens/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ThanhVienList = db.ThanhViens.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // POST: ThanhViens/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,PID,HoTen,NamSinh,NamMat,GioiTinh,VoChong,DiaPhuong,LyLich,Avt,IsTruongHo,IsTruongChi")] ThanhVien thanhVien, HttpPostedFileBase file, bool popup = false)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    // Xử lý tên file tránh trường hợp tên file có chứa ký tự gây lỗi
                    string fileName = Common.XuLyTenFile(file);
                    var folderPath = $"\\Files\\ThanhVien\\{thanhVien.ID}\\";
                    // Gọi hàm lưu file
                    Common.LuuFile(file, fileName, folderPath, true);
                    // Lưu vị trí file vào trường Avt
                    thanhVien.Avt = (folderPath + fileName).Replace("\\", "/");
                }
                db.Entry(thanhVien).State = EntityState.Modified;
                db.SaveChanges();
                if (popup == true)
                    return RedirectToAction("AutoClose", "Home");
                else
                    return RedirectToAction("Index");
            }
            return View(thanhVien);
        }

        // GET: ThanhViens/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // POST: ThanhViens/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            db.ThanhViens.Remove(thanhVien);
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
