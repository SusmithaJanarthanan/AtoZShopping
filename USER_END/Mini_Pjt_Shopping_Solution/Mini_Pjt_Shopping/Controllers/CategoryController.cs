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
    public class CategoryController : ApiController
    {
        MiniProject_ShopEntities entities = new MiniProject_ShopEntities();

        [HttpGet]
        public HttpResponseMessage GetCategory()
        {
            List<Category> cats = new List<Category>();
            var res = entities.GetAllCategory().ToList();
            foreach (var item in res.ToList())
            {
                cats.Add(new Category { Category_Id=item.Category_Id,Category_Name=item.Category_Name} );
            }
            return Request.CreateResponse(HttpStatusCode.OK, cats);
        }

        [HttpGet]
        public HttpResponseMessage GetAllProductsofOneCategory(int id)
        {
            List<Product> pdts = new List<Product>();
            var res = entities.GetOneCategory(id).ToList();
            foreach (var item in res.ToList())
            {
                pdts.Add(new Product { Prod_Id = item.Prod_Id, Prod_Name = item.Prod_Name,  Prod_Quantity = item.Prod_Quantity, Prod_Description = item.Prod_Description, Prod_Image = item.Prod_Image });
            }
            return Request.CreateResponse(HttpStatusCode.OK, pdts);
        }


    }
}
