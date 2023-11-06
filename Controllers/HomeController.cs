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
    public class HomeController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TocUoc()
        {
            return View();
        }

        public ActionResult PhaDo()
        {
            return View(db.ThanhViens.ToList());
        }
        public ActionResult PhaDo1(int top = 0)
        {
            var data = db.ThanhViens.AsNoTracking().ToList();
            return View(data);
        }

        public ActionResult Login()
        {
            ViewBag.ThongBao = null;
            return View();
        }

        public class TaiKhoan
        {
            public string UserName { get; set; }
            public string Password { get; set; }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(TaiKhoan taiKhoan)
        {
            Session["User"] = taiKhoan;
            if (taiKhoan.UserName == "admin" && taiKhoan.Password == "admin@123")
                return RedirectToAction("Index");
            else
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không chính xác";
            return View();
        }
        public ActionResult Logout()
        {
            ViewBag.ThongBao = null;
            Session.Clear();
            return RedirectToAction("Login");
        }
    }
}