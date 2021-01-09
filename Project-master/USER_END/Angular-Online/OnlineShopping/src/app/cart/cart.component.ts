import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Products } from '../models/product.model';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  id?:any;
  cart:any;
  constructor(private cartService:CartService,private myRoute:ActivatedRoute,private route:Router)
  {
    
    this.id=this.myRoute.snapshot.params["id"];
    this.cartService.getCart(this.id).subscribe(data=>{
      this.cart=data;
    })


  }
  

  total()
  {

  }
  calculate()
  {
    return 1
  }
  ngOnInit(): void {
  }

}
