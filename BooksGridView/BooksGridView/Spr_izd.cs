//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BooksGridView
{
    using System;
    using System.Collections.Generic;
    
    public partial class Spr_izd
    {
        public Spr_izd()
        {
            this.books_new = new HashSet<books_new>();
        }
    
        public string Izd { get; set; }
        public int id { get; set; }
    
        public virtual ICollection<books_new> books_new { get; set; }
    }
}
