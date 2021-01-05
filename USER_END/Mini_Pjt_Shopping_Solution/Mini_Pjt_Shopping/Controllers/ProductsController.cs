using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mini_Pjt_Shopping.Models;

namespace Mini_Pjt_Shopping.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class ProductsController : ApiController
    {
        MiniProject_ShopEntities entities = new MiniProject_ShopEntities();

        [HttpGet]
        public HttpResponseMessage GetAllProducts()
        {
            List<Product> pdts = new List<Product>();
            var res = entities.GetAllPdts().ToList();
            foreach (var item in res.ToList())
            {
                pdts.Add(new Product { Prod_Id = item.Prod_Id, Prod_Name = item.Prod_Name, Prod_Price = item.Prod_Price, Prod_Quantity = item.Prod_Quantity, Prod_Description = item.Prod_Description, Prod_Image = item.Prod_Image });
            }
            return Request.CreateResponse(HttpStatusCode.OK, pdts);
        }

        public HttpResponseMessage Get(int id)
        {
            Product pdt = entities.Products.Where(p => p.Prod_Id == id).FirstOrDefault();
            return Request.CreateResponse(HttpStatusCode.Created, pdt);
        }


    }
}
