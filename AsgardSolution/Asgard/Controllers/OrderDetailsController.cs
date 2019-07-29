using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Asgard.Models;

namespace Asgard.Controllers
{
    public class OrderDetailsController : Controller
    {
        private AsgardEntities1 db = new AsgardEntities1();

        // GET: OrderDetails1
        public ActionResult Index()
        {
            var orderDetails = db.OrderDetails.Include(o => o.Beer).Include(o => o.Order);
            return View(orderDetails.ToList());
        }

        // GET: OrderDetails1/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var orderDetails = db.OrderDetails.Where(o => o.OrderID == id);
            Order order = db.Orders.Find(id);
            if (orderDetails == null)
            {
                return HttpNotFound();
            }
            ViewBag.OrderID = order.ID;
            return View(orderDetails.ToList());
        }

        // GET: OrderDetails1/Create
        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
             
            Order order = db.Orders.Find(id);
            if (order == null)
            {
                return HttpNotFound();
            }
            ViewBag.BeerID = new SelectList(db.Beers, "ID", "Name");
            ViewBag.OrderID = order.ID;
            return View();
        }

        // POST: OrderDetails1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID, OrderID,BeerID,Quantity")] OrderDetail orderDetail, int id)
        {
            if (ModelState.IsValid)
            {
                var order = db.Orders.Find(id);
                var beer = db.Beers.Find(orderDetail.BeerID);

                orderDetail.OrderID = id;
                orderDetail.Order = order;
                orderDetail.Beer = beer;
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
                return RedirectToAction("Details", new { id = orderDetail.OrderID});
            }

            ViewBag.BeerID = new SelectList(db.Beers, "ID", "Name", orderDetail.BeerID);
            ViewBag.OrderID = new SelectList(db.Orders, "ID", "Date", orderDetail.OrderID);
            return View(orderDetail);
        }

        // GET: OrderDetails1/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return HttpNotFound();
            }
            ViewBag.BeerID = new SelectList(db.Beers, "ID", "Name", orderDetail.BeerID);
            ViewBag.OrderID = new SelectList(db.Orders, "ID", "Date", orderDetail.OrderID);
            return View(orderDetail);
        }

        // POST: OrderDetails1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderID,BeerID,Quantity")] OrderDetail orderDetail)
        {
            if (ModelState.IsValid)
            {
                db.Entry(orderDetail).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", new { id = orderDetail.OrderID });
            }
            ViewBag.BeerID = new SelectList(db.Beers, "ID", "Name", orderDetail.BeerID);
            ViewBag.OrderID = new SelectList(db.Orders, "ID", "Date", orderDetail.OrderID);
            return View(orderDetail);
        }

        // GET: OrderDetails1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            if (orderDetail == null)
            {
                return HttpNotFound();
            }
            return View(orderDetail);
        }

        // POST: OrderDetails1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            OrderDetail orderDetail = db.OrderDetails.Find(id);
            db.OrderDetails.Remove(orderDetail);
            db.SaveChanges();
            return RedirectToAction("Details", new { id = orderDetail.OrderID });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
