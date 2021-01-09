import { Component, OnInit } from '@angular/core';
 import { Router, ActivatedRoute } from '@angular/router';  
 import { RouterLink, } from '@angular/router';
import { addRetailerervice } from '../services/addretailer.service';
import { authService } from '../services/auth.service';
import { RetailerService } from '../services/Retailer.service';

@Component({
  selector: 'app-frontpage',
  templateUrl: './frontpage.component.html',
  styleUrls: ['./frontpage.component.css']
})
export class FrontpageComponent implements OnInit {
 msg:boolean;
  constructor(private addservice:addRetailerervice,private router:Router,private retailerservice:RetailerService,private authservice:authService) { }
  Details()
  {
   // this.addservice.getOneRetailer(this.authservice.retailerid).subscribe();
    this.router.navigate(['/OneRetailer']);

  }
  Delete()
  { 
    this.msg=true;

  }
  DeleteSure()
  {
    this.retailerservice.DeleteAccount( this.authservice.retailerid).subscribe();
  }
  Add_Product()
  {
    this.router.navigate(['/addProduct']);
  }
  Update_Product()
  {
    this.router.navigate(['/updateproduct']);
  }
  GetStatus()
  {
    this.router.navigate(['/productstatus']);
  }
  DeleteProducts()
  {
    this.router.navigate(['/deleteproduct']);
  }
  ChangePass()
  {
    this.router.navigate(['/changePass']);
  }
  

  ngOnInit(): void {
  }

}
