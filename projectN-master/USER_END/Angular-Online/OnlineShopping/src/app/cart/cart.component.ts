
import { APP_ID, Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';

import { Cart } from '../models/cart.model';
import { Products } from '../models/product.model';
import { CartService } from '../services/cart.service';

@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.css']
})
export class CartComponent implements OnInit {
  @Input()
  id?:any;
  cart:any;
  totalAmount:number;
  quantity:number;
  guestForm: FormGroup;
  val?:any;
  cartTotal:number=0;
  
  constructor(private cartService:CartService,private myRoute:ActivatedRoute,private route:Router,private form:FormBuilder)
  {this.guestForm=this.form.group({
    quantity: ['test', [ Validators.min(1)]]
  });
   this.val=document.getElementById("qt");
    this.quantity=1;
    this.totalAmount=0;
    
    this.id=this.myRoute.snapshot.params["id"];
    this.cartService.getCart(this.id).subscribe(data=>{
      this.cart=data;
    })
    this.cartService.calTotal(this.id).subscribe((data:any)=>{this.cartTotal=data
        });

  }

  updateTotal(retailPrice: number, number: number) {
    this.quantity += number;
    this.totalAmount += retailPrice * number;
}


changeQty(id:number ,q:number)
{
if(q==1)
{
  this.cartService.incQty(id,q).subscribe(data=>console.log(data));
  window.location.reload();
}
else
{
  this.cartService.decQty(id).subscribe(data=>console.log(data));
  window.location.reload();
}
}
  total(id:number)
  {
    this.cartService.calTotal(id).subscribe((data : any)=> {
      this.cartTotal=data;
    })

  }
  calculate()
  {
    return 1
  }
  removeFromCart(cart_id:number)
  {
    this.cartService.removeFromCart(cart_id).subscribe(data=>console.log(data));
    window.location.reload();
  }
  ngOnInit(): void {

    //this.cart.forEach((item : any) => {
    //  this.cartTotal +=(item.Prod_Quantity * item.Prod_Price)
      
    //});
    
  }

}
