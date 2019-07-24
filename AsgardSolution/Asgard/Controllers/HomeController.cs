using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Asgard.Controllers
{
    public class HomeController : Controller
    {
        Models.AsgardEntities1 db = new Models.AsgardEntities1();

        public ActionResult Index()
        {
            return View(db.Beers.ToList());
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}