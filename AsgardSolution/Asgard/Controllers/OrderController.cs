using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Asgard.Controllers
{
    public class OrderController : Controller
    {
        // GET: Order
        public ActionResult Index()
        {
            Models.AsgardEntities1 db = new Models.AsgardEntities1();
            //linq devolver informacion
            var List = from o in db.Orders
                       select o;
            return View(List.ToList());
        }
        //metodo de accion create get
        [HttpGet]
        public ActionResult Create()
        {
            Models.Order order = new Models.Order();

            return View(order);
        }
        [HttpPost]
        public ActionResult Create(Models.Order order)
        {
            Models.AsgardEntities1 db = new Models.AsgardEntities1();
            db.Orders.Add(order);
            db.SaveChanges();
            return RedirectToAction("Index");
            
        }
    }
}