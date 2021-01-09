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
    public class CartController : ApiController
    {
        MiniProject_ShopEntities entities = new MiniProject_ShopEntities();

        [HttpGet]
        public HttpResponseMessage GetCart(int id)
        {
            List<Product> prodlist = new List<Product>();
            var res = entities.GetCart(id).ToList();

            foreach (var item in res.ToList())
            {
                Product pdt = entities.Products.Where(p => p.Prod_Id == item.Prod_Id).FirstOrDefault();
                prodlist.Add(new Product { Prod_Id = pdt.Prod_Id, Prod_Name = pdt.Prod_Name, Prod_Price = item.Prod_Price, Prod_Quantity = item.Prod_Quantity, Prod_Description = pdt.Prod_Description, Prod_Image = pdt.Prod_Image });

            }
            return Request.CreateResponse(HttpStatusCode.OK, prodlist);
        }

        [HttpPost]
        public HttpResponseMessage AddToCart(Cart cart)
        {
            List<Cart> cartlist = new List<Cart>();
            var res = entities.GetCart(cart.User_Id).ToList();
            foreach (var item in res)
            {
                cartlist.Add(new Cart { User_Id = item.User_Id, Prod_Id = item.Prod_Id });
            }
            Cart cart1 = entities.Carts.Where(w => w.User_Id == cart.User_Id && w.Prod_Id == cart.Prod_Id).FirstOrDefault();
            if (cart1 != null)
            {
                entities.Carts.Where(w => w.User_Id == cart.User_Id && w.Prod_Id == cart.Prod_Id).FirstOrDefault().Prod_Quantity+=cart.Prod_Quantity;
                entities.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Quantity updated in cart");
            }
            else
            {
                entities.AddTOCart(cart.User_Id, cart.Prod_Id, cart.Prod_Quantity, cart.Prod_Price);
                entities.SaveChanges();
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Added to Cart");
        }
    }
}
