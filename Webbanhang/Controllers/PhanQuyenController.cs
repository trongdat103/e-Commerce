using System;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Webbanhang.Models;
using System.Web;
using System.Collections.Generic;
namespace Webbanhang.Controllers
{
    [Authorize(Roles = "QuanLyQuyen")]
    public class PhanQuyenController : Controller
    {

        ShopsEntities14 db = new ShopsEntities14();
        // GET: PhanQuyen
        public ActionResult DanhsachloaiTV()
        {
            return View(db.LoaiThanhViens.OrderBy(n => n.TenLoaiTV));
        }
        [HttpGet]
        public ActionResult PhanQuyen(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            LoaiThanhVien ltv = db.LoaiThanhViens.SingleOrDefault(n => n.MaLoaiTV == id);
            if (ltv == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaQuyen = db.Quyens;
            ViewBag.LoaiTVQuyen = db.LoaiThanhVien_Quyenn.Where(n => n.MaLoaiTV == id);
            return View(ltv);
        }
        [HttpPost]
        public ActionResult PhanQuyen(int? MaLTV, IEnumerable<LoaiThanhVien_Quyenn> lstPhanQuyen)
        {
            var lstDaPhanQuyen = db.LoaiThanhVien_Quyenn.Where(n => n.MaLoaiTV == MaLTV);
            if (lstDaPhanQuyen.Count() != 0)
            {
                if (lstPhanQuyen != null)
                {
                    foreach (var item in lstPhanQuyen)
                    {
                        db.LoaiThanhVien_Quyenn.RemoveRange(lstDaPhanQuyen);
                        item.MaLoaiTV = int.Parse(MaLTV.ToString());
                        db.LoaiThanhVien_Quyenn.Add(item);
                    }
                    db.SaveChanges();
                }
                else
                {
                    db.LoaiThanhVien_Quyenn.RemoveRange(lstDaPhanQuyen);
                    db.SaveChanges();
                }
            }
            else
            {

                if (lstPhanQuyen != null)
                {
                    foreach (var item in lstPhanQuyen)
                    {
                        item.MaLoaiTV = int.Parse(MaLTV.ToString());
                        db.LoaiThanhVien_Quyenn.Add(item);

                    }
                    db.SaveChanges();
                }

            }
            return RedirectToAction("DanhsachloaiTV");
        }
    }
}