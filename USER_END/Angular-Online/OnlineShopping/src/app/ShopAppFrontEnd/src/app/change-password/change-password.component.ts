import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import { Dummy } from '../models/dummy.model';
import { Retailer } from '../models/Retailer.model';
import { authService } from '../services/auth.service';
import { RetailerService } from '../services/Retailer.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {
retailer:Retailer;
dummy:Dummy;
dummy1:Dummy;
password:string;
retailerdetails:any;
msg:any;
  constructor(private cookieservice:CookieService,private retailerservice:RetailerService,private authservice:authService) {
    this.retailer=new Retailer();
    this.dummy=new Dummy();
    this.dummy1=new Dummy();
 
   }
   Add()
   {
     this.retailer.Retail_Id=this.authservice.retailerid;
     this.retailerservice.ChangePass(this.retailer).subscribe(u=>{this.retailerdetails = u;alert('Password Changed Successfully')},
      err=>this.msg = err.error.Message);

   }
   check(val){
    this.password=this.cookieservice.get('password');   
    if (val.value !== this.password){
      
      return true;

    }
    return false;
  }
  comparepass(p1,p2)
  {
    if(p1.value!==p2.value)
    {
      return true;
    }
    return false;
  }

  ngOnInit(): void {
  }

}
