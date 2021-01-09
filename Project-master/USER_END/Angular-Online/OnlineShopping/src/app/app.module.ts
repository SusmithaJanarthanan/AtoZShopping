import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { GetallpdtComponent } from './getallpdt/getallpdt.component';
import { PdtService } from './services/pdts.service';
import {FormsModule} from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { PdtdetailComponent } from './pdtdetail/pdtdetail.component';
import { NavbarComponent } from './navbar/navbar.component';
import { CatdetailsComponent } from './catdetails/catdetails.component';
import { WishlistComponent } from './wishlist/wishlist.component';
import { WishService } from './services/wish.service';
import { CartComponent } from './cart/cart.component';
import { CartService } from './services/cart.service';
import { CompareComponent } from './compare/compare.component';


@NgModule({
  declarations: [
    AppComponent,
    GetallpdtComponent,
    PdtdetailComponent,
    NavbarComponent,
    CatdetailsComponent,
    WishlistComponent,
    CartComponent,
    CompareComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [PdtService,WishService,CartService],
  bootstrap: [AppComponent]
})


export class AppModule
{

}
