
import { APP_ID, Component, Input, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
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
id1:any;
  val?:any;
  cartTotal:number=0;

  constructor(private cartService:CartService,private myRoute:ActivatedRoute,private route:Router,private cookieservice:CookieService)
   {
    //this.guestForm=this.form.group({
  //   quantity: ['test', [ Validators.min(1)]]
  // });
  //  this.val=document.getElementById("qt");
  //   this.quantity=1;
  //   this.totalAmount=0;

    // this.id=this.myRoute.snapshot.params["id"];
    this.id=this.cookieservice.get('userid');
    this.cartService.getCart(this.id).subscribe(data=>{
      this.cart=data;
    })
    this.cartService.calTotal(this.id).subscribe((data:any)=>{this.cartTotal=data
        });
        this.id1=parseInt(this.cookieservice.get('userid'));

  }

  redirect()
  {
    this.route.navigate(["Checkout",this.id1]);
  }


changeQty(id:number ,q:number)
{
if(q==1)
{
  this.cartService.incQty(id,q).subscribe(data=>console.log(data));
  // alert("hiii")
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
