using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

using Shopping_Project.Models;

namespace Shopping_Project.Controllers
{
    [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
    public class RetailerController : ApiController
    {
        Shopping_AppEntities entities = new Shopping_AppEntities();
        public IEnumerable<Retailer> Get()
        {
            return entities.Retailers.ToList();
        }
        [HttpPost]
    public IEnumerable<Retailer_Revenue_Result> Retailer_Tally(Retailer retailer)
        {
            decimal price = 0;
            List<Retailer_Revenue_Result> Retailer_Orders = new List<Retailer_Revenue_Result>();
              Retailer_Orders = entities.Retailer_Revenue(retailer.Retail_Id).ToList();
            foreach(Retailer_Revenue_Result item in Retailer_Orders)
            {
                price = (item.Prod_Price.Value) * (item.Prod_Quantity.Value);

            }
            return Retailer_Orders.ToList();

        }
    }
}
