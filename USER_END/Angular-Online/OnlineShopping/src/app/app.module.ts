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
import { SortPipe } from './sort.pipe';
import { HomeComponent } from './home/home.component';
import { FilterPipe } from './filter.pipe';
import { NgxImageZoomModule } from 'ngx-image-zoom';
import { UserregisterComponent } from './userregister/userregister.component';
import { CartComponent } from './cart/cart.component';
import { WishlistComponent } from './wishlist/wishlist.component';
import { WishService } from './services/wish.service';
import { CartService } from './services/cart.service';




@NgModule({
  declarations: [
    AppComponent,
    GetallpdtComponent,
    PdtdetailComponent,
    NavbarComponent,
    CatdetailsComponent,
    SortPipe,
    HomeComponent,
    FilterPipe,
    UserregisterComponent,
    CartComponent,
    WishlistComponent
    ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgxImageZoomModule
  ],
  providers: [PdtService,WishService,CartService],
  bootstrap: [AppComponent]
})


export class AppModule
{

}
