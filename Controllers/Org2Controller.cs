using GiaPha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GiaPha.Controllers
{
    public class Org2Controller : Controller
    {
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
        private GiaPhaEntities db = new GiaPhaEntities();
        // GET: Org2
        public ActionResult Index()
        {
            ViewBag.quyenQuanLy = KiemTraQuyen();
            var data = db.ThanhViens.ToList();
            return View(data);
        }
    }
}