using GiaPha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace GiaPha.Controllers
{
    public class AccountController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();
        public bool KiemTraQuyen()
        {
            GiaPhaEntities db = new GiaPhaEntities();
            Account userSession = (Account)Session["User"];
            var count = 0;
            if (userSession != null)
            {
                count = db.PhanQuyens.Count(m => m.idAccount == userSession.ID && m.idChucNang == 1);
            }
            if (count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        // GET: Account
        public ActionResult Index()
        {
            if (KiemTraQuyen() == false)
            {
                return Redirect("/BaoLoi/KhongCoQuyen");

            }
            ViewBag.AccountList = db.Accounts.AsNoTracking().ToList();
            return View(db.Accounts.ToList());
        }

        // GET: Account/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Account/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Account/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Account/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.AccountList = db.Accounts.AsNoTracking().ToList();
            Account taiKhoan = db.Accounts.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);          
        }

        // POST: Account/Edit/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,UserName,Password,Name,Role")] Account taiKhoan, bool popup = false)
        {
            if(ModelState.IsValid)
            {
                // TODO: Add update logic here
                db.Entry(taiKhoan).State = EntityState.Modified;
                db.SaveChanges();
                if (popup == true)
                    return RedirectToAction("AutoClose", "Home");
                else
                    return RedirectToAction("Index");               
            }
                return View();
        }

        // GET: Account/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Account taiKhoan = db.Accounts.Find(id);
            if (taiKhoan == null)
            {
                return HttpNotFound();
            }
            return View(taiKhoan);
        }

        // POST: Account/Delete/5
        [HttpPost,ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(int id)
        {
            Account taiKhoan = db.Accounts.Find(id);
            db.Accounts.Remove(taiKhoan);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
