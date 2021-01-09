import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Cart } from '../models/cart.model';
import { Wishlist } from '../models/wishlist.model';
import { CartService } from '../services/cart.service';
import { WishService } from '../services/wish.service';

@Component({
  selector: 'app-wishlist',
  templateUrl: './wishlist.component.html',
  styleUrls: ['./wishlist.component.css']
})
export class WishlistComponent implements OnInit {
wishlist:any;
id?:any;
cart:Cart;
item:any;
  constructor(private myRoute:ActivatedRoute, private wishService:WishService,private route:Router,
    private cartService:CartService) 
  {this.item=new Wishlist();
    this.cart=new Cart();
    this.id=this.myRoute.snapshot.params["id"];
    console.log(this.id);
    
    this.wishService.getWishlist(this.id).subscribe(data=>{
      this.wishlist=data;
      console.log(data);
    })
  }
  
  addToCart(item:any)
  {this.cart.User_Id=this.id;
    this.cart.Prod_Id=item.Prod_Id;
    this.cart.Prod_Price=item.Prod_Price;
    this.cart.Prod_Quantity=item.Prod_Quantity;
    
    this.cartService.addToCart(this.cart).subscribe(data=>console.log(data));
  }
  /*removeFromWishlist(item:Wishlist)
  {
    this.wishService.removeFromWishlist(item).subscribe(data=>console.log(data));
  }*/
  ngOnInit(): void {
  }

}
