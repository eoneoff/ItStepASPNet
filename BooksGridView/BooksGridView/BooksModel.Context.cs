﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class booksEntities : DbContext
    {
        public booksEntities()
            : base("name=booksEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<books_new> books_new { get; set; }
        public DbSet<Spr_format> Spr_format { get; set; }
        public DbSet<Spr_izd> Spr_izd { get; set; }
        public DbSet<Spr_kategory> Spr_kategory { get; set; }
        public DbSet<Spr_themes> Spr_themes { get; set; }
    }
}