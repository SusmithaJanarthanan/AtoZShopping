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

import {NgxPaginationModule} from 'ngx-pagination'
import { UserService } from './services/user.service';
import { ComparePasswordDirective } from './directives/compare-password.directive';
import { NameheaderComponent } from './nameheader/nameheader.component';
import { authService } from './services/auth.service';
import { CookieService } from 'ngx-cookie-service';
import { LoginComponent } from './login/login.component';
import { AuthGuardService } from './services/auth-guard.service';
import { PinchZoomModule } from 'ngx-pinch-zoom';
import { CheckoutpageComponent } from './checkoutpage/checkoutpage.component';
import { CheckoutService } from './services/checkout.service';
import { MyProfileService } from './services/myprofile.service';
import { OrderService } from './services/orders.service';
import { ThankyouComponent } from './thankyou/thankyou.component';





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
    WishlistComponent,
    ComparePasswordDirective,
    NameheaderComponent,
    LoginComponent,
    CheckoutpageComponent,
    ThankyouComponent

    ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgxImageZoomModule,
    NgxPaginationModule,
    PinchZoomModule
  ],
  providers: [PdtService,WishService,CartService,UserService,authService,CookieService,AuthGuardService,CheckoutService,MyProfileService,OrderService],
  bootstrap: [AppComponent]
})


export class AppModule
{

}
