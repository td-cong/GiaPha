using GiaPha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Entity;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Reflection;
using System.Security.Principal;

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
                count = db.Accounts.Count(m => m.ID == userSession.ID && m.idChucNang == 4 );
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
            var account = new Account();
            account.ID = db.Accounts.Any() ? db.Accounts.Max(a => a.ID) + 1 : 1;
            ViewBag.AccountList = db.Accounts.AsNoTracking().ToList();
            return View(account);
        }

        // POST: Account/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID, UserName, Password, Name, idChucNang, Role")] Account account)
        {
            if (ModelState.IsValid)
            {
                db.Accounts.Add(account);              
                db.SaveChanges();   
                
                //db.Entry(account).State = EntityState.Modified;
                //db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(account);
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
        public ActionResult Edit([Bind(Include = "ID,UserName,Password,Name,idChucNang,Role")] Account taiKhoan, bool popup = false)
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


        // Account ThanhVien
        public ActionResult Create2()
        {
            ViewBag.ThanhVienList = db.ThanhViens.AsNoTracking().ToList();
            return View();
        }

        // POST: Account/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create2(ThanhVien model)
        {

            if (ModelState.IsValid)
            {
                var member = db.ThanhViens.Find(model.ID);
                if (member != null)
                {
                    member.IdTaiKhoan = model.IdTaiKhoan;
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
            }
            return View(model);
        }

        public ActionResult GetMemberInfo(int id)
        {
            var member = db.ThanhViens.Find(id);
            if (member != null)
            {
                return Json(new { idTaiKhoan = member.IdTaiKhoan }, JsonRequestBehavior.AllowGet);
            }
            return Json(null, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit2(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ThanhVienList = db.ThanhViens.AsNoTracking().ToList();
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // POST: Edit
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit2(int id, int IdTaiKhoan)
        {
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }

            thanhVien.IdTaiKhoan = IdTaiKhoan;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Delete
        public ActionResult Delete2(int id)
        {
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // POST: Delete
        [HttpPost, ActionName("Delete2")]
        public ActionResult DeleteConfirmed(int id)
        {
            ThanhVien thanhVien = db.ThanhViens.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }

            thanhVien.IdTaiKhoan = null; // or default value
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
