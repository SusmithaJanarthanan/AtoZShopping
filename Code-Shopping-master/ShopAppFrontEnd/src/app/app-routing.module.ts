import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AddProductsComponent } from './add-products/add-products.component';
import { AddretailerComponent } from './addretailer/addretailer.component';
import { ChangePasswordComponent } from './change-password/change-password.component';
import { DeleteproductsComponent } from './deleteproducts/deleteproducts.component';
import { FrontpageComponent } from './frontpage/frontpage.component';
import { LoginComponent } from './login/login.component';
import { ProductstatusComponent } from './productstatus/productstatus.component';
import { RetailerRevenueComponent } from './retailer-revenue/retailer-revenue.component';
import { RetailerComponent } from './retailer/retailer.component';
import { AuthGuardService } from './services/auth-guard.service';
import { UpdateProductService } from './services/updateproduct.service';
import { UpdateproductComponent } from './updateproduct/updateproduct.component';

const routes: Routes = [
  {path:"retailerview",component:RetailerComponent,canActivate: [AuthGuardService] },
  {path:"OneRetailer",component:RetailerRevenueComponent,canActivate: [AuthGuardService]},
  {path:"addProduct",component:AddProductsComponent,canActivate: [AuthGuardService]},
  {path:"updateproduct",component:UpdateproductComponent,canActivate: [AuthGuardService]},
  {path:"addRetailer",component:AddretailerComponent},
  {path:"",component:LoginComponent},
  {path:"FrontPage",component:FrontpageComponent,canActivate: [AuthGuardService]},
  {path:"productstatus",component:ProductstatusComponent,canActivate:[AuthGuardService]},
  {path:"deleteproduct",component:DeleteproductsComponent,canActivate:[AuthGuardService]},
  {path:"changePass",component:ChangePasswordComponent,canActivate:[AuthGuardService]}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
