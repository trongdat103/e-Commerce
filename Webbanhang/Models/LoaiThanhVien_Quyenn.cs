//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Webbanhang.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class LoaiThanhVien_Quyenn
    {
        public string MaQuyen { get; set; }
        public int MaLoaiTV { get; set; }
        public string GhiChu { get; set; }
    
        public virtual LoaiThanhVien LoaiThanhVien { get; set; }
        public virtual Quyen Quyen { get; set; }
    }
}
