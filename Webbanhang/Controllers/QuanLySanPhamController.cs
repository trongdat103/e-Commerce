using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
namespace Webbanhang.Controllers
{
    [Authorize(Roles = "QuanLySanPham")]
    public class QuanLySanPhamController : Controller
    {
        ShopsEntities14 db = new ShopsEntities14();
        // GET: QuanLySanPham        
        public ActionResult Index()
        {
            return View(db.SanPhams.Where(n => n.DaXoa == 0).OrderByDescending(m => m.IDSP).ToList());
        }
        [HttpGet]       
        public ActionResult TaoMoi()
        {
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.IDNCC), "IDNCC", "TenNCC");
            ViewBag.IDLSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.IDLSP), "IDLSP", "TenLSP");
            ViewBag.IDNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.IDNSX), "IDNSX", "TenNSX");
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult TaoMoi(SanPham sanPham, HttpPostedFileBase HinhAnh1, HttpPostedFileBase HinhAnh2, HttpPostedFileBase HinhAnh3, HttpPostedFileBase HinhAnh4)
        {
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.IDNCC), "IDNCC", "TenNCC");
            ViewBag.IDLSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.IDLSP), "IDLSP", "TenLSP");
            ViewBag.IDNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.IDNSX), "IDNSX", "TenNSX");
            if (HinhAnh1 == null)
            {
                ViewBag.Images = "Cần chọn hình trước khi lưu";
                return View();
            }
            if (HinhAnh1 != null && HinhAnh1.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh1.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh1.SaveAs(path);
                    sanPham.HinhAnh1 = fileName;
                }
            }
            if (HinhAnh2 == null)
            {
                ViewBag.Images = "Cần chọn hình trước khi lưu";
                return View();
            }
            if (HinhAnh2 != null && HinhAnh2.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName1 = Path.GetFileName(HinhAnh2.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path1 = Path.Combine(Server.MapPath("~/assets/images/product"), fileName1);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path1))
                {
                    ViewBag.upload1 = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh2.SaveAs(path1);
                    sanPham.HinhAnh2 = fileName1;
                }
            }
            if (HinhAnh3 == null)
            {
                ViewBag.Images = "Cần chọn hình trước khi lưu";
                return View();
            }
            if (HinhAnh3 != null && HinhAnh3.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName2 = Path.GetFileName(HinhAnh3.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path2 = Path.Combine(Server.MapPath("~/assets/images/product"), fileName2);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path2))
                {
                    ViewBag.upload2 = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh3.SaveAs(path2);
                    sanPham.HinhAnh3 = fileName2;
                }
            }
            if (HinhAnh3 == null)
            {
                ViewBag.Images = "Cần chọn hình trước khi lưu";
                return View();
            }
            if (HinhAnh4 != null && HinhAnh4.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName3 = Path.GetFileName(HinhAnh4.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path3 = Path.Combine(Server.MapPath("~/assets/images/product"), fileName3);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path3))
                {
                    ViewBag.upload2 = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh4.SaveAs(path3);
                    sanPham.HinhAnh4 = fileName3;
                }
            }
            sanPham.DaXoa = 0;
            db.SanPhams.Add(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult ChinhSua(int? id)
        {
            if (id == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            SanPham sp = db.SanPhams.SingleOrDefault(n => n.IDSP == id);
            if (sp == null)
            {
                return HttpNotFound();
            }
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "IDNCC", "TenNCC", sp.IDNCC);
            ViewBag.IDLSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.TenLSP), "IDLSP", "TenLSP", sp.IDLSP);
            ViewBag.IDNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.TenNSX), "IDNSX", "TenNSX", sp.IDNSX);
            return View(sp);
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult ChinhSua(SanPham model, HttpPostedFileBase HinhAnh1)
        {
            ViewBag.IDNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "IDNCC", "TenNCC", model.IDNCC);
            ViewBag.IDLSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.TenLSP), "IDLSP", "TenLSP", model.IDLSP);
            ViewBag.IDNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.TenNSX), "IDNSX", "TenNSX", model.IDNSX);
            if (HinhAnh1 != null && HinhAnh1.ContentLength > 0)
            {
                // Lấy tên hình ảnh 
                var fileName = Path.GetFileName(HinhAnh1.FileName);
                // Lấy hình ảnh chuyển vào thư mục hình ảnh
                var path = Path.Combine(Server.MapPath("~/assets/images/product"), fileName);
                // Nếu có rồi thì thông báo 
                if (System.IO.File.Exists(path))
                {
                    ViewBag.upload = "Hình đã tồn tại";
                    return View();
                }
                else
                {
                    // lấy hình ảnh đưa vào thư mục 
                    HinhAnh1.SaveAs(path);
                    model.HinhAnh1 = fileName;
                }
            }
            // Lấy tên hình ảnh           
            db.Entry(model).State = System.Data.Entity.EntityState.Modified;
            model.HinhAnh1 = model.HinhAnh1;           
            db.SaveChanges();
            return RedirectToAction("Index");
    }
    [HttpGet]
    public ActionResult Xoa(int? id)
    {
        if (id == null)
        {
            Response.StatusCode = 404;
            return null;
        }
        SanPham sp = db.SanPhams.SingleOrDefault(n => n.IDSP == id);
        if (sp == null)
        {
            return HttpNotFound();
        }
        ViewBag.IDNCC = new SelectList(db.NhaCungCaps.OrderBy(n => n.TenNCC), "IDNCC", "TenNCC", sp.IDNCC);
        ViewBag.IDLSP = new SelectList(db.LoaiSanPhams.OrderBy(n => n.TenLSP), "IDLSP", "TenLSP", sp.IDLSP);
        ViewBag.IDNSX = new SelectList(db.NhaSanXuats.OrderBy(n => n.TenNSX), "IDNSX", "TenNSX", sp.IDNSX);
        return View(sp);
    }
    [HttpPost]
    public ActionResult Xoa(int id)
    {
        if (id == null)
        {
            Response.StatusCode = 404;
            return null;
        }
        SanPham sp = db.SanPhams.SingleOrDefault(n => n.IDSP == id);
        if (sp == null)
        {
            return HttpNotFound();
        }
        db.SanPhams.Remove(sp);
        db.SaveChanges();
        return RedirectToAction("Index");
    }
}
}



