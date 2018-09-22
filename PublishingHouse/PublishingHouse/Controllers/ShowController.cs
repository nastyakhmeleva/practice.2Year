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

        public ActionResult ShowBookExemplar(int id)
        {
            ModelContainer model=new ModelContainer();
            ViewBag.Book = model.BooksSet.Find(id);
            ViewBag.BookExemplar = model.BookExemplarSet.Where(x=>x.Books.Id==id).ToList();
            return View();
        }

        public ActionResult ShowAuthor(int id)
        {
            ModelContainer model = new ModelContainer();
            ViewBag.Author = model.AuthorSet.Find(id);
            ViewBag.Books = model.BooksSet.Where(x => x.Author.Id == id).ToList();
            return View();
        }

        public ActionResult ShowGenre(int id)
        {
            ModelContainer model = new ModelContainer();
            ViewBag.Genre = model.GenreSet.Find(id);
            ViewBag.Books = model.BooksSet.Where(x => x.Genre.Id == id).ToList();
            return View();
        }
    }
}