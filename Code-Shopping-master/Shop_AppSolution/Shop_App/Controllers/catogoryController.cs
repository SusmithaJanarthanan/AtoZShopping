using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Shop_App.Models;

namespace Shop_App.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class catogoryController : ApiController
    {
        Shopping_AppEntities entities = new Shopping_AppEntities();
        public IEnumerable<Category> Get()
        {
            return entities.Categories.ToList();
        }
    }
}
