
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using GiaPha.Models;
using ClosedXML.Excel;
using System.IO;

namespace GiaPha.Controllers
{
    public class ThanhViensController : Controller
    {
        private GiaPhaEntities db = new GiaPhaEntities();
        private string serverRootFolderPath = System.Web.HttpContext.Current.Server.MapPath("~/");
        //private string serverRootFolderPath = System.Web.Hosting.HostingEnvironment.MapPath("~/");
        
        public bool KiemTraQuyen()
        {
            GiaPhaEntities db = new GiaPhaEntities();
            Account userSession = (Account)Session["User"];
            var count = 0;
            if (userSession != null)
            {
                count = db.Accounts.Count(m => m.ID == userSession.ID && (m.idChucNang == 1 || m.idChucNang==4));
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

        // GET: ThanhViens
        public ActionResult Index()
        {           
            if(KiemTraQuyen()==false)
            {
                return Redirect("/BaoLoi/KhongCoQuyen");
                              
            }
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            return View(db.ThanhVienNs.ToList());     
        }

        // GET: ThanhViens/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ViewBag.ThanhVienList = db.ThanhVienNs.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            ThanhVienN thanhVien = db.ThanhVienNs.Find(id);
            if (thanhVien == null)
            {
                return HttpNotFound();
            }
            return View(thanhVien);
        }

        // GET: ThanhViens/Create
        public ActionResult Create()
        {
            ViewBag.ThanhVienList = db.ThanhVienNs.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            return View();
        }

        // POST: ThanhViens/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,PID,HoTen,NamSinh,NamMat,GioiTinh,VoChong,DiaPhuong,NoiO,LyLich,Avt,IsTruongHo,IsTruongChi")] ThanhVienN thanhVien, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                db.ThanhVienNs.Add(thanhVien);
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
            ViewBag.ThanhVienList = db.ThanhVienNs.AsNoTracking().ToList();
            ViewBag.VoChongList = db.VoChongs.AsNoTracking().ToList();
            ThanhVienN thanhVien = db.ThanhVienNs.Find(id);
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
        public ActionResult Edit([Bind(Include = "ID,PID,HoTen,NamSinh,NamMat,GioiTinh,VoChong,DiaPhuong,NoiO,LyLich,Avt,IsTruongHo,IsTruongChi")] ThanhVienN thanhVien, HttpPostedFileBase file, bool popup = false)
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
            ThanhVienN thanhVien = db.ThanhVienNs.Find(id);
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
            ThanhVienN thanhVien = db.ThanhVienNs.Find(id);
            db.ThanhVienNs.Remove(thanhVien);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Import()
        {
            if (!KiemTraQuyen()) return Redirect("/BaoLoi/KhongCoQuyen");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Import(HttpPostedFileBase excelFile)
        {
            if (!KiemTraQuyen())
                return RedirectToAction("KhongCoQuyen", "BaoLoi");

            if (excelFile == null || excelFile.ContentLength == 0)
            {
                ModelState.AddModelError("", "Vui lòng chọn file Excel!");
                return View();
            }

            try
            {
                List<string> errors = new List<string>();
                int successCount = 0;

                using (var workbook = new XLWorkbook(excelFile.InputStream))
                {
                    var worksheet = workbook.Worksheet(1); // Lấy sheet đầu tiên
                    var rows = worksheet.RowsUsed().Skip(1); // Bỏ qua dòng tiêu đề

                    foreach (var row in rows)
                    {
                        try
                        {
                            var tv = new ThanhVienN
                            {
                                ID = row.Cell(1).GetValue<int>(),
                                PID = row.Cell(2).IsEmpty() ? null : (int?)row.Cell(2).GetValue<int>(),
                                HoTen = row.Cell(3).GetString(),
                                NamSinh = row.Cell(4).IsEmpty() ? null : row.Cell(4).GetString(),
                                NamMat = row.Cell(5).IsEmpty() ? null : row.Cell(5).GetString(),
                                GioiTinh = row.Cell(6).GetValue<int>() == 1,
                                VoChong = row.Cell(7).IsEmpty() ? null : (int?)row.Cell(7).GetValue<int>(),
                                DiaPhuong = row.Cell(8).IsEmpty() ? null : row.Cell(8).GetString(),
                                NoiO = row.Cell(9).IsEmpty() ? null : row.Cell(9).GetString(),
                                LyLich = row.Cell(10).IsEmpty() ? null : row.Cell(10).GetString(),
                                Avt = row.Cell(11).IsEmpty() ? null : row.Cell(11).GetString(),
                                IsTruongHo = row.Cell(12).IsEmpty() ? false : row.Cell(12).GetValue<int>() == 1,
                                IsTruongChi = row.Cell(13).IsEmpty() ? false : row.Cell(13).GetValue<int>() == 1,
                                IdTaiKhoan = row.Cell(14).IsEmpty() ? null : (int?)row.Cell(14).GetValue<int>()
                            };

                            // Kiểm tra bắt buộc
                            if (string.IsNullOrWhiteSpace(tv.HoTen))
                            {
                                errors.Add($"Dòng {row.RowNumber()}: Thiếu tên thành viên");
                                continue;
                            }

                            db.ThanhVienNs.Add(tv);
                            successCount++;
                        }
                        catch (Exception ex)
                        {
                            errors.Add($"Dòng {row.RowNumber()}: Lỗi - {ex.Message}");
                        }
                    }

                    db.SaveChanges();
                }

                // Hiển thị kết quả
                ViewBag.SuccessCount = successCount;
                ViewBag.Errors = errors;
                return View("ImportResult");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", $"Lỗi khi đọc file Excel: {ex.Message}");
                return View();
            }
        }

        public ActionResult DownloadTemplate()
        {
            using (var workbook = new XLWorkbook())
            {
                var worksheet = workbook.Worksheets.Add("ThanhVien");

                // Tạo header
                string[] headers = {
            "ID", "PID (ID cha/mẹ)", "Họ Tên (*)", "Năm Sinh", "Năm Mất",
            "Giới Tính (Nam=1/Nữ=0)", "ID Vợ/Chồng", "Địa Phương", "Lý Lịch",
            "Ảnh đại diện", "Là Trưởng Họ (1/0)", "Là Trưởng Chi (1/0)", "ID Tài Khoản"
        };

                for (int i = 0; i < headers.Length; i++)
                {
                    worksheet.Cell(1, i + 1).Value = headers[i];
                    worksheet.Cell(1, i + 1).Style.Font.Bold = true;
                    worksheet.Cell(1, i + 1).Style.Fill.BackgroundColor = XLColor.LightGray;
                }

                // Thêm dữ liệu mẫu
                worksheet.Cell(2, 3).Value = "Nguyễn Văn A";
                worksheet.Cell(2, 4).Value = 1950;
                worksheet.Cell(2, 5).Value = 2020;
                worksheet.Cell(2, 6).Value = 1; // Nam 


                // Định dạng cột
                worksheet.Columns().AdjustToContents();

                // Lưu file
                var stream = new MemoryStream();
                workbook.SaveAs(stream);
                stream.Position = 0;

                return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                          "Mau_Import_ThanhVien.xlsx");
            }
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
