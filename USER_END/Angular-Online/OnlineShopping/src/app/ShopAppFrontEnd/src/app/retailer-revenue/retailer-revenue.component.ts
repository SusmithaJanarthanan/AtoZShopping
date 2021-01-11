import { Component, OnInit } from '@angular/core';
import { Retailer } from '../models/Retailer.model';
import { addRetailerervice } from '../services/addretailer.service';
import { authService } from '../services/auth.service';
import { RetailerService } from '../services/Retailer.service';

@Component({
  selector: 'app-retailer-revenue',
  templateUrl: './retailer-revenue.component.html',
  styleUrls: ['./retailer-revenue.component.css']
})
export class RetailerRevenueComponent implements OnInit {
 retailer:Retailer;
 retailerdetails:any;
 msg:any;
 retailerpersonal:any;
 amount:any;
  constructor(private authservice:authService,private retailerservice:RetailerService,private addservice:addRetailerervice) {
    this.retailer=new Retailer();
    this.retailerservice.getRetailerPersonal(this.authservice.retailerid).subscribe( u=>{this.retailerpersonal = u},
    err=>this.msg = err.error.Message);
    this.addservice.getOneRetailer(this.authservice.retailerid).subscribe(data=>this.retailerdetails=data);   

   }

 
  getRetailerAmount()
  {
    this.retailerservice.getRetailerAmount(this.authservice.retailerid).subscribe(data=>this.amount=data);  

  }


  ngOnInit(): void {
  }

}
