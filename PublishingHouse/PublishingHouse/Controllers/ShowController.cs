using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PublishingHouse.Controllers
{
    public class ShowController : Controller
    {
        // GET: Show
        public ActionResult ShowBooks()
        {
            return View();
        }
    }
}