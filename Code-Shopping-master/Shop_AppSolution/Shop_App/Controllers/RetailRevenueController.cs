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
    public class RetailRevenueController : ApiController
    {
        Shopping_AppEntities entities = new Shopping_AppEntities();
       [HttpGet]
        [Route("api/RetailRevenue/amount/{id}")]
        public decimal Retailer_Amount(int id)
        {
          
            decimal price = 0;
            List<retailer_revdetails_Result> Retailer_Orders = new List<retailer_revdetails_Result>();
            Retailer_Orders = entities.retailer_revdetails(id).ToList();
            foreach (retailer_revdetails_Result item in Retailer_Orders)
                {
                    price = price + item.Total.Value;

                }
              
            return price;

        }
        [HttpGet]
        [Route("api/RetailRevenue/revenue")]
        public IEnumerable<retailer_revdetails_Result> Retailer_Tally(int id)
        {
            //
            List<retailer_revdetails_Result> Retailer_Orders = new List<retailer_revdetails_Result>();
            Retailer_Orders = entities.retailer_revdetails(id).ToList();

            return Retailer_Orders.ToList();

        }
        [HttpGet]
        [Route("api/RetailRevenue/productstatus/{id}")]
        public HttpResponseMessage Product_Status(int id)
        {
            
                List<Product> prodstatus = new List<Product>();
                prodstatus = entities.Products.Where(u => u.Retail_Id == id).ToList();
            
            if (prodstatus != null)
            {
                return Request.CreateResponse(HttpStatusCode.Created, prodstatus);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, "retailer Does Not Exist");
            }


        }
        [HttpGet]
        [Route("api/RetailRevenue/updatestatus/{id}")]
        public HttpResponseMessage update_status(int id)
        {
            List<Update_Products> upd_pdt = new List<Update_Products>();
            upd_pdt = entities.Update_Products.Where(u => u.Retail_Id == id).ToList();
            if(upd_pdt !=null)
            {
                return Request.CreateResponse(HttpStatusCode.OK, upd_pdt);
            }
            else
            {
                return Request.CreateErrorResponse(HttpStatusCode.NotAcceptable, "retailer Does Not Exist");
            }
        }
       
    }
}
