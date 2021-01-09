import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-orders',
  templateUrl: './orders.component.html',
  styleUrls: ['./orders.component.scss']
})
export class OrdersComponent implements OnInit {

  constructor(private route:Router) { }
  orderPlaced(){
    this.ngOnInit();
    this.route.navigate(["thankyoupage"])

  }

  ngOnInit(): void {
  }
  
  // countPrice(){
  //    this.Price = 0;
  //     for(let p of this.ordersArray){
  //       this.Price += p.price*p.quantity
  //     }
  // }

}
