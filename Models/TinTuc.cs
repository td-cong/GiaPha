//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GiaPha.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TinTuc
    {
        public int ID { get; set; }
        public Nullable<int> IdLoaiTinTuc { get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; }
        public string TacGia { get; set; }
        public string AnhDaiDien { get; set; }
        public Nullable<bool> TinNoiBat { get; set; }
        public string TrangThai { get; set; }
        public string TomTat { get; set; }
    
        public virtual LoaiTinTuc LoaiTinTuc { get; set; }
    }
}
