using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PublishingHouse.Controllers
{
    public class AddNewObjectController : Controller
    {
        #region Serie
        public ActionResult NewSerie()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddSerie(string Name, string Type)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "" && Type != "")
            {
                Series serie = new Series()
                {
                    Name = Name,
                    CoverType = Type
                };

                model.SeriesSet.Add(serie);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewBookExemplar/" + book.Id);
            }

            return Redirect("~/AddNewObject/NewSerie");
        }
        #endregion

        #region City
        public ActionResult NewCity()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddCity(string Name)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "")
            {
                City city = new City()
                {
                    Name = Name
                };

                model.CitySet.Add(city);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewStore");
            }

            return Redirect("~/AddNewObject/NewCity");
        }
        #endregion

        #region Store
        public ActionResult NewStore()
        {
            return View();
        }

        [HttpPost]
        public RedirectResult AddStore(string Name, int CityId, string Street, string House)
        {
            ModelContainer model = new ModelContainer();

            if (Name != "" && Street != "" && House != "")
            {
                Store store = new Store()
                {
                    Name = Name,
                    City = model.CitySet.Find(CityId),
                    Address = Street+" - "+House
                };

                model.StoreSet.Add(store);
                model.SaveChanges();

                return Redirect("~/AddNewObject/NewBookExemplar/" + book.Id);
            }

            return Redirect("~/AddNewObject/NewStore");
        }
        #endregion

        #region BookExemplar
        public static Books book=new Books();

        public ActionResult NewBookExemplar(int id)
        {
            ModelContainer model=new ModelContainer();
            book = model.BooksSet.Find(id);
            ViewBag.Book = book;
            return View();
        }

        [HttpPost]
        public RedirectResult AddBookExemplar(string Year, int StoreId, string Number, int SerieId)
        {
            ModelContainer model = new ModelContainer();

            if (Year != "" && Number != "")
            {
                BookExemplar book = new BookExemplar()
                {
                    Books = AddNewObjectController.book,
                    Year = Int32.Parse(Year),
                    Number = Int32.Parse(Number),
                    Store = model.StoreSet.Find(StoreId),
                    Series = model.SeriesSet.Find(SerieId)
                };

                model.BookExemplarSet.Add(book);
                model.SaveChanges();

                return Redirect("~/Show/ShowBookExemplar/"+book.Id);
            }

            return Redirect("~/AddNewObject/NewBookExemplar/" + book.Id);
        }
        #endregion

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
                Books b = new Books()
                {
                    Name = Name,
                    Description = Info,
                    Author = model.AuthorSet.Find(AuthorId),
                    Genre = model.GenreSet.Find(GenreId)
                };

                model.BooksSet.Add(b);
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