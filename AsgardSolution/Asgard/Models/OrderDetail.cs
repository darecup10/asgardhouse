//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Asgard.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderDetail
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public int BeerID { get; set; }
        public int Quantity { get; set; }
    
        public virtual Beer Beer { get; set; }
        public virtual Order Order { get; set; }
    }
}
