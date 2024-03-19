using GiaPha.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GiaPha.Controllers
{
    public class OrgController : Controller
    {
        GiaPhaEntities context = new GiaPhaEntities();

        public ActionResult Index()
        {
            return View();
        }

        public JsonResult Read()
        {
            var employees = context.ThanhViens.ToList();
            return Json(employees, JsonRequestBehavior.AllowGet);
        }

        public EmptyResult Update(List<ThanhVien> model)
        {
            foreach (var employeeModel in model)
            {
                var employee = context.ThanhViens.FirstOrDefault(p => p.ID == employeeModel.ID);

                if (employee == null)
                {
                    employee = new ThanhVien();
                    context.ThanhViens.Add(employee);
                }

                employee.ID = employeeModel.ID;
                employee.PID = employeeModel.PID;
                employee.HoTen = employeeModel.HoTen;
                employee.NamSinh = employeeModel.NamSinh;
                employee.Avt = employeeModel.Avt;
            }

            var modelIds = model.Select(p => p.ID);
            var removeEmployees = context.ThanhViens.Where(p => !modelIds.Contains(p.ID));

            foreach (var employee in removeEmployees)
            {
                context.ThanhViens.Remove(employee);
            }

            context.SaveChanges();

            return new EmptyResult();
        }
        
    }
}