﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CourseProject.DataBaseModel
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KursBdEntities : DbContext
    {
        public KursBdEntities()
            : base("name=KursBdEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Cart> Cart { get; set; }
        public virtual DbSet<Cart_Products> Cart_Products { get; set; }
        public virtual DbSet<Categories> Categories { get; set; }
        public virtual DbSet<Order_Product> Order_Product { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<OrderStatuses> OrderStatuses { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<Roles> Roles { get; set; }
        public virtual DbSet<Users> Users { get; set; }
    }
}