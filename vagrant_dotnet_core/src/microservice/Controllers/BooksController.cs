using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using microservice.Models;

namespace microservice.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        [HttpGet]
        public ActionResult<List<Book>> Get()
        {
            List<Book> books = new List<Book>();
            books.Add(new Book() {Author="Stephen King", Title="The Shining"});
            books.Add(new Book() {Author="Stephen King", Title="Under the Dome"});
            return books;
        }

    }
}
