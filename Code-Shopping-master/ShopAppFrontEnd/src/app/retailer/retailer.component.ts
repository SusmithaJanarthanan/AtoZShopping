import { Component, OnInit } from '@angular/core';
import { RetailerService } from '../services/Retailer.service';

@Component({
  selector: 'app-retailer',
  templateUrl: './retailer.component.html',
  styleUrls: ['./retailer.component.css']
})
export class RetailerComponent implements OnInit {
retailer:any;
  constructor(private retailerservice:RetailerService) { }

  ngOnInit(): void {
  }
  getRetailers()
  {
    // this.retailerservice.getAllRetailers().subscribe(a=>{
    //   this.retailer=a;
    // })

}

}
