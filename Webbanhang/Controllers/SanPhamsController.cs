using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
namespace Webbanhang.Controllers
{
    public class SanPhamsController : Controller
    {
        ShopsEntities14 db = new ShopsEntities14();
        // GET: SanPham
        public ActionResult ChiTietSanPham(int? id)
        {
            var sanpham = db.SanPhams.SingleOrDefault(m => m.IDSP == id);
            if (sanpham != null)
            {
                var sanphamtuongtu = db.SanPhams.Where(m => m.IDLSP == sanpham.IDLSP);
                if (sanphamtuongtu != null)
                {
                    ViewBag.TinhSoLuong = sanphamtuongtu.Count();
                }
                ViewBag.ListSanPhamtuongtu = sanphamtuongtu;
            }
            return View(sanpham);
        }
        [ChildActionOnly]
        public ActionResult SanPhamStyle1Partial()
        {
            return PartialView();
        }
        [ChildActionOnly]
        public ActionResult SanPhamStyle2Partial()
        {
            return PartialView();
        }
        public ActionResult SanPhamStyle3Partial()
        {
            return PartialView();
        }
        public ActionResult SanPhamStyle4Partial()
        {
            return PartialView();
        }
        public ActionResult SanPhamStyle5Partial()
        {
            return PartialView();
        }
        public ActionResult Sanphamtuongtu()
        {
            return PartialView();
        }
    }

}