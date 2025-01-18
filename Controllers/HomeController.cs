using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.Mvc;
using GiaPha.Models;


namespace GiaPha.Controllers
{
    public class HomeController : Controller
    {
        public bool KiemTraQuyen()
        {
            GiaPhaEntities db = new GiaPhaEntities();
            Account userSession = (Account)Session["User"];
            var count = 0; 
            if (userSession != null) {
                count = db.Accounts.Count(m => m.ID == userSession.ID && m.idChucNang == 4);
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
            //if (KiemTraQuyen() == false)
            //{
            //    return Redirect("/BaoLoi/KhongCoQuyen");

            //}
            ViewBag.quyenQuanLy = KiemTraQuyen();
            var data = db.ThanhViens.AsNoTracking().ToList();
            return View(data);
        }

        public ActionResult AutoClose()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            ViewBag.ThongBao = null;
            return View();
        }

        //public class TaiKhoan
        //{
        //    [Required]
        //    public string UserName { get; set; }
         //   public string Password { get; set; }
        //}

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string user, string password)
        {
            GiaPhaEntities db = new GiaPhaEntities();
            var taiKhoan = db.Accounts.SingleOrDefault(m => m.UserName.ToLower() == user.ToLower() && m.Password == password);

            if (taiKhoan != null)
            {
                Session["User"] = taiKhoan;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ViewBag.ThongBao = "Tài khoản hoặc mật khẩu không chính xác";
                return View();
            }        
        }

        public ActionResult Logout()
        {
            ViewBag.ThongBao = null;
            Session.Clear();
            return RedirectToAction("Index");
        }
    }
}