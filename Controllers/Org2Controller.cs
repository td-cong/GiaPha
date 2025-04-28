using GiaPha.Models;
using SelectPdf;
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
                count = db.Accounts.Count(m => m.ID == userSession.ID && (m.idChucNang == 1 || m.idChucNang == 4));
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
            var data = db.ThanhVienNs.ToList();
            return View(data);
        }
        public ActionResult OrgMale()
        {

            ViewBag.quyenQuanLy = KiemTraQuyen();
            var data = db.ThanhVienNs.ToList();
            return View(data);
        }

        public ActionResult OrgSpouse()
        {
            ViewBag.quyenQuanLy = KiemTraQuyen();
            var data = db.ThanhViens.ToList();
            return View(data);
        }

        [HttpGet]
        public ActionResult GetAllConChau(int parentID)
        {
            var allData = db.ThanhVienNs.ToList();
            var conChau = allData.Where(x => x.PID == parentID);
            var voChong = allData.Where(x => x.VoChong == parentID);

            var ketQua = conChau.Concat(voChong).ToList();

            if (ketQua != null)
            {
                var conChauList = new List<object>();
                foreach (var item in ketQua)
                {
                    var levelOffset = item.VoChong != null ? -1 : 0;

                    var namsinh = item.NamSinh != null ? item.NamSinh.ToString() : "";
                    if (item.NamMat != null)
                    {
                        namsinh += " - " + item.NamMat.ToString();
                    }

                    var title = "";
                    if (item.IsTruongChi.HasValue && item.IsTruongChi.Value)
                    {
                        title += "Trưởng Chi";
                    }
                    if (item.IsTruongHo.HasValue && item.IsTruongHo.Value)
                    {
                        if (!string.IsNullOrEmpty(title))
                        {
                            title += " ";
                        }
                        title += "Trưởng Họ";
                    }

                    var conChauItem = new
                    {
                        id = item.ID,
                        name = item.HoTen,
                        namsinh = namsinh,
                        title = title,
                        avt = item.Avt,
                        spouse = item.VoChong,
                        levelOffset = levelOffset,
                        children = GetAllConChau(item.ID)
                    };

                    conChauList.Add(conChauItem);
                }

                return Json(conChauList, JsonRequestBehavior.AllowGet);
            }

            return Json(new List<object>(), JsonRequestBehavior.AllowGet);
        }

        public ActionResult SavePdf(string html)
        {
            HtmlToPdf convert = new HtmlToPdf();
            html = html.Replace("start", "<").Replace("end", ">");

            PdfDocument doc = convert.ConvertHtmlString(html);

            //doc.Save($@"{AppDomain.CurrentDomain.BaseDirectory}\url.pdf");

            byte[] pdfFile = doc.Save();

            doc.Close();

            return File(pdfFile, "application/pdf");
        }
    }
}