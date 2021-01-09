using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using Mini_Pjt_Shopping.Models;
using System.Data.Entity;

namespace Mini_Pjt_Shopping.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class WishlistController : ApiController
    {
        MiniProject_ShopEntities entities = new MiniProject_ShopEntities();

        
        [HttpGet]
        public HttpResponseMessage GetWishlist(int id)
        {
            List<Product> prodlist = new List<Product>();
            var res = entities.GetWishlist(id).ToList();
  
            foreach (var item in res.ToList())
            {
                Product pdt = entities.Products.Where(p => p.Prod_Id == item.Prod_Id).FirstOrDefault();
                prodlist.Add(new Product { Prod_Id = pdt.Prod_Id, Prod_Name = pdt.Prod_Name, Prod_Price = pdt.Prod_Price, Prod_Quantity = pdt.Prod_Quantity, Prod_Description = pdt.Prod_Description, Prod_Image = pdt.Prod_Image });

            }
            return Request.CreateResponse(HttpStatusCode.OK, prodlist);

        }

        [HttpPost]
        public HttpResponseMessage AddToWishlist(Wishlist wish)
        {
            List<Wishlist> wishlist = new List<Wishlist>();
            var res = entities.GetWishlist(wish.User_Id).ToList();
            foreach (var item in res)
            {
                wishlist.Add(new Wishlist {User_Id=item.User_Id,Prod_Id=item.Prod_Id });
            }
            Wishlist wish1 = entities.Wishlists.Where(w => w.User_Id == wish.User_Id && w.Prod_Id == wish.Prod_Id).FirstOrDefault();
            if(wish!=null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, "Already Present");
            }
            else
            {
                entities.AddToWishlist(wish.User_Id,wish.Prod_Id);
                entities.SaveChanges();
            }

            return Request.CreateResponse(HttpStatusCode.OK, "Added to wishlist");
        }

        [HttpDelete]
        public HttpResponseMessage DelWishItem(Wishlist wish)
        {
            Wishlist wish1 = entities.Wishlists.Where(u => u.User_Id == wish.User_Id && u.Prod_Id == wish.Prod_Id).FirstOrDefault();
            if(wish1!=null)
            {
                entities.Wishlists.Remove(wish1);
                entities.SaveChanges();
            }
            else
                return Request.CreateResponse(HttpStatusCode.BadRequest, "Not Present in Wishlist");

            return Request.CreateResponse(HttpStatusCode.OK, "Product Removed From Wishlist");
        }
    }
}
