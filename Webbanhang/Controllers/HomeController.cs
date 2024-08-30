using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
using PagedList;
using PagedList.Mvc;
namespace Webbanhang.Controllers
{
    public class HomeController : Controller
    {
        ShopsEntities14 db = new ShopsEntities14();
        public ActionResult Index()
        {
            var sanphammoi = db.SanPhams.Where(m => m.Moi == 1 && m.DaXoa == 0).OrderByDescending(m => m.IDSP).ToList(); 
            ViewBag.ListSanPhamMoi = sanphammoi;
            var Tulanh = db.SanPhams.Where(m => m.IDLSP == 3 && m.DaXoa == 0);
            ViewBag.ListTulanh = Tulanh;
            var tivi = db.SanPhams.Where(m => m.IDLSP == 2 && m.DaXoa == 0);
            ViewBag.ListTivi = tivi;
            var giadungmoi = db.SanPhams.Where(m => m.IDLSP == 1 && m.DaXoa == 0 && m.Moi == 1);
            ViewBag.Listgiadung = giadungmoi;
            var giadungnoibat = db.SanPhams.Where(m => m.IDLSP == 1 && m.DaXoa == 0 && m.LuotBinhChon > 20);
            ViewBag.Listgiadungnoibat = giadungnoibat;
            return View();
        }
        public ActionResult Headertop()
        {
            return View();
        }
        public ActionResult HeaderSearch()
        {
            return View();
        }
        public ActionResult Menu()
        {
            return View();
        }
        public ActionResult Slide()
        {
            return View();
        }
        public ActionResult Tulanh(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 3).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.TinhSoLuong = sanphams.Count();
            }
            return View(sanphams.ToPagedList(pageNum, pageSize));
           
        }     


    public ActionResult TulanhSamsung()
        {
            var sanphams = db.SanPhams.Where(m => m.MaSP == "TuLanhSamsung").OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.TinhSoLuongss = sanphams.Count();
            }               
            return View(sanphams);

        }     
        
        public ActionResult Giadung()
        {
            var danhSachsp = db.SanPhams.Where(x => x.IDLSP == 1).OrderByDescending(m => m.IDSP).ToList(); 
            if (danhSachsp != null)
            {
                ViewBag.TinhSoLuonggiadung = danhSachsp.Count();
            }         
            return View(danhSachsp);
        }
        public ActionResult maylocnuoc()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 6).OrderByDescending(m => m.IDSP).ToList(); 
            if (sanphams != null)
            {
                ViewBag.maylocnuoc = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult noicom()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 9).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.noicom = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult noichien()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 10).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.noichien = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult bepdien()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 11).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.bepdien = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult tivi(int? page)
        {
            int pageSize = 7;
            int pageNum = (page ?? 1);
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 2).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.tivi = sanphams.Count();
            }
            return View(sanphams.ToPagedList(pageNum, pageSize));

        }
        public ActionResult CapHDMI()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 16).OrderByDescending(m => m.IDSP).ToList(); 
            if (sanphams != null)
            {
                ViewBag.cap = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult dieukhien()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 17).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.dieukhien = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult androidtv()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 18).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.android = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult khungtv()
        {
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 19).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.khungtv = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult samsung()
        {
            var sanphams = db.SanPhams.Where(m => m.IDNSX == 9).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.samsung = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult LG()
        {
            var sanphams = db.SanPhams.Where(m => m.IDNSX == 10).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.LG = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult Sony()
        {
            var sanphams = db.SanPhams.Where(m => m.IDNSX == 11).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.Sony = sanphams.Count();
            }
            return View(sanphams);
        }
        public ActionResult tiviPhukien(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 2 || m.IDLSP == 16 || m.IDLSP == 17 || m.IDLSP == 18 || m.IDLSP == 19).OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.tiviphukien = sanphams.Count();
            }
            return View(sanphams.ToPagedList(pageNum, pageSize));

        }
        public ActionResult TulanhAqua()
        {
            var sanphams = db.SanPhams.Where(m => m.MaSP == "TulanhAqua").OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.tulanhaqua = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult TulanhToshiba()
        {
            var sanphams = db.SanPhams.Where(m => m.MaSP == "TuLanhToshiba").OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.Tulanhtoshiba = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult TulanhLG()
        {
            var sanphams = db.SanPhams.Where(m => m.MaSP == "TulanhLG").OrderByDescending(m => m.IDSP).ToList();
            if (sanphams != null)
            {
                ViewBag.tulanhLG = sanphams.Count();
            }
            return View(sanphams);

        }
        public ActionResult Dogiadung(int? page)
        {
            int pageSize = 8;
            int pageNum = (page ?? 1);
            var sanphams = db.SanPhams.Where(m => m.IDLSP == 10 || m.IDLSP == 9 || m.IDLSP == 11 || m.IDLSP == 6 || m.IDLSP == 1).OrderByDescending(m => m.IDSP).ToList(); 
            if (sanphams != null)
            {
                ViewBag.dogiadung = sanphams.Count();
            }
            return View(sanphams.ToPagedList(pageNum, pageSize));

        }
        public ActionResult SanphamstylePartial()
        {
            return PartialView();
        }
        public ActionResult SidebarSanPhamPartial()
        {
            var sanPham = db.SanPhams;
            return View(sanPham);
        }
        public ActionResult SanPhamTheoNhaSanXuat(int? maLoai, int? maNSX, int? Page)
        {
            var sanpham = db.SanPhams.Where(m => m.IDNSX == maNSX && m.IDLSP == maLoai && m.DaXoa == 0).ToList();
            int pageSize = 9;
            int pageNumbber = (Page ?? 1);
            ViewBag.MaLoai = maLoai;
            ViewBag.MaNSX = maNSX;
            return View(sanpham.OrderBy(m => m.DonGia).ToPagedList(pageNumbber, pageSize));
        }

    }
}