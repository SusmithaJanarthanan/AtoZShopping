import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CartComponent } from './cart/cart.component';
import { CatdetailsComponent } from './catdetails/catdetails.component';
import { CheckoutpageComponent } from './checkoutpage/checkoutpage.component';
import { GetallpdtComponent } from './getallpdt/getallpdt.component';
import { HomeComponent } from './home/home.component';
import { LoginComponent } from './login/login.component';
import { PdtdetailComponent } from './pdtdetail/pdtdetail.component';
import { AuthGuardService } from './services/auth-guard.service';
import { ThankyouComponent } from './thankyou/thankyou.component';
import { UserregisterComponent } from './userregister/userregister.component';
import { WishlistComponent } from './wishlist/wishlist.component';


const routes: Routes = [
  // {path:"",redirectTo: 'Home', pathMatch: 'full' },
  {path:"Products",component:GetallpdtComponent},
  {path:"Details/:id",component:PdtdetailComponent},
  {path:"DetailsOfCategory/:id",component:CatdetailsComponent},
  {path:"Home",component:HomeComponent },
  {path:"Wishlist/:id",component:WishlistComponent,canActivate: [AuthGuardService] },
  {path:"Cart/:id",component:CartComponent,canActivate: [AuthGuardService] },
  {path:"SignUp",component:UserregisterComponent},
  {path:"Login",component:LoginComponent},
  {path:"Checkout/:id1",component:CheckoutpageComponent},
  {path:"",component:HomeComponent},
  {path:"thankyou",component:ThankyouComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
