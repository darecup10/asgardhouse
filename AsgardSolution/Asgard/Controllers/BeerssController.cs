using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Asgard.Controllers
{
    public class BeerssController : Controller
    {
        // GET: Beerss
        public ActionResult Index()
        {
            Models.AsgardEntities1 db = new Models.AsgardEntities1();

            return View(db.Beers.ToList());
        }
    }
}