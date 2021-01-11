import { Component, OnInit } from '@angular/core';
import { authService } from '../services/auth.service';
import { RetailerService } from '../services/Retailer.service';

@Component({
  selector: 'app-productstatus',
  templateUrl: './productstatus.component.html',
  styleUrls: ['./productstatus.component.css']
})
export class ProductstatusComponent implements OnInit {
  productstatus:any;
  updatestatus:any;
  msg:any;

  constructor(private authservice:authService,private retailerservice:RetailerService) {
    this.retailerservice.getretailerProductstatus(this.authservice.retailerid).subscribe( u=>{this.productstatus = u},
      err=>this.msg = err.error.Message);

      this.retailerservice.getretailerUpdatestatus(this.authservice.retailerid).subscribe( u=>{this.updatestatus = u},
        err=>this.msg = err.error.Message)
   }

  ngOnInit(): void {
  }

}
