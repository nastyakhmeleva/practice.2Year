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

        #region Book
        public ActionResult NewBook()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddBook(string Name, string Info, int AuthorId, int GenreId)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "" && Info != "")
            {
                Books book = new Books()
                {
                    Name = Name,
                    Description = Info,
                    Author = model.AuthorSet.Find(AuthorId),
                    Genre = model.GenreSet.Find(GenreId)
                };

                model.BooksSet.Add(book);
                model.SaveChanges();

                return Redirect("~/Show/ShowBooks");
            }

            return Redirect("~/AddNewObject/NewBook");
        }
#endregion

        #region Author
        public ActionResult NewAuthor()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddAuthor(string Surname, string Name, string SecondName, int CountryId)
        {
            ModelContainer model = new ModelContainer();

            if (Surname != "" && Name != "" && SecondName != "")
            {
                Author author = new Author()
                {
                    Surname = Surname,
                    Name = Name,
                    SecondName = SecondName,
                    Country = model.CountrySet.Find(CountryId)
                };

                model.AuthorSet.Add(author);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewBook");
            }

            return Redirect("~/AddNewObject/NewAuthor");
        }
        #endregion
        
        #region Genre
        public ActionResult NewGenre()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddGenre(string Name, string Info)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "" && Info != "")
            {
                Genre genre = new Genre()
                {
                    Name = Name,
                    Description = Info
                };

                model.GenreSet.Add(genre);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewBook");
            }

            return Redirect("~/AddNewObject/NewGenre");
        }
        #endregion

        #region Country
        public ActionResult NewCountry()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddCountry(string Name)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "")
            {
                Country country = new Country()
                {
                    Name = Name
                };

                model.CountrySet.Add(country);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewAuthor");
            }

            return Redirect("~/AddNewObject/NewCountry");
        }
        #endregion

    }
}