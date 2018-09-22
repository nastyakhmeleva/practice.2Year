using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PublishingHouse.Controllers
{
    public class AddNewObjectController : Controller
    {
        // GET: AddNewObject
        public ActionResult AddBookExemplar()
        {
            return View();
        }
    }
}