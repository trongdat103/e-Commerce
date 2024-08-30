using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Webbanhang.Models;
using System.Net.Mail;
namespace Webbanhang.Controllers
{
    [Authorize(Roles = "QuanLyDonHang")]
    public class QuanLyDonHangController : Controller
    {
        ShopsEntities14 db = new ShopsEntities14();
        // GET: QuanLyDonHang
        public ActionResult ChuaThanhToan()
        {
            var Unpaid = db.DonDatHanggs.Where(m => m.DaThanhToan == 0).OrderBy(m => m.NgayDat).ToList();
            return View(Unpaid);
        }
        public ActionResult ChuaGiao()
        {
            var Unpaid = db.DonDatHanggs.Where(m => m.TinhTrangGiao == 0 && m.DaThanhToan == 1).OrderBy(m => m.NgayDat).ToList();
            return View(Unpaid);
        }
        public ActionResult DaGiaoDaThanhToan()
        {
            var Unpaid = db.DonDatHanggs.Where(m => m.TinhTrangGiao == 1 && m.DaThanhToan == 1).OrderBy(m => m.NgayDat).ToList();
            return View(Unpaid);
        }
        [HttpGet]
        public ActionResult DuyetDonHang (int ? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            DonDatHangg donDatHang = db.DonDatHanggs.SingleOrDefault(m => m.MaDDH == id);
            if (donDatHang == null)
            {
                return HttpNotFound();
            }
            
            // Hiển thị thi tiết đơn hàng lên view
            var listChiTietDonHang = db.ChiTietDonHangs.Where(m => m.MaDDH == id);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;
            return View(donDatHang);
        }
        public ActionResult DuyetDonHang(DonDatHangg model)
        {         
            // Truy vấn dữ liệu đơn hàng đó
            DonDatHangg updateDDH = db.DonDatHanggs.SingleOrDefault(m => m.MaDDH == model.MaDDH);
            updateDDH.DaThanhToan = model.DaThanhToan;
            updateDDH.NgayGiao = model.NgayGiao;
            updateDDH.TinhTrangGiao = model.TinhTrangGiao;
            db.SaveChanges();
            var listChiTietDonHang = db.ChiTietDonHangs.Where(m => m.MaDDH == model.MaDDH);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;
            //GuiMail("Xác nhận đơn hàng của hệ thống Fastshop.vn", "nguyentrongdat.d21ctc1@muce.edu.vn", "topmarvel123@gmail.com", "topmarvel12345", "Đơn hàng của bạn đã được đặt thành công");
            return RedirectToAction("ChuaThanhToan");
        }
        public ActionResult ChiTietDonHang(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(System.Net.HttpStatusCode.BadRequest);
            }
            DonDatHangg donDatHang = db.DonDatHanggs.SingleOrDefault(m => m.MaDDH == id);
            if (donDatHang == null)
            {
                return HttpNotFound();
            }

            // Hiển thị thi tiết đơn hàng lên view
            var listChiTietDonHang = db.ChiTietDonHangs.Where(m => m.MaDDH == id);
            ViewBag.ChiTietDonDatHang = listChiTietDonHang;
            return View(donDatHang);
        }
        public static void GuiMail(string Title, string ToEmail, string FromEmail, string PassWord, string Content)
        {
            // Gọi mail 
            MailMessage mail = new MailMessage();
            mail.To.Add(ToEmail);// địa chỉ nhận     
            mail.From = new MailAddress(ToEmail); // địa chỉ gửi
            mail.Subject = Title;
            mail.Body = Content;
            mail.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com"; // host gửi gmail 
            smtp.Port = 578;// port của mail
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new System.Net.NetworkCredential(FromEmail, PassWord);// Tài khoản passwork người gửi 
            smtp.EnableSsl = true;
            smtp.Send(mail);
        }
       
    }
}