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
    public class UpdateProductController : ApiController
    {
        Shopping_AppEntities db = new Shopping_AppEntities();
        public IEnumerable<Update_Products> Get()
        {
            return db.Update_Products.ToList();
        }
        //public void Post(Update_Products product)
        //{
        //    product.Update_Status = "waiting";
        //    db.Update_Products.Add(product);
        //    db.SaveChanges();
        //}
    }
}
