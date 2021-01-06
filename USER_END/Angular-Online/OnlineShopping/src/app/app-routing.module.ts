import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CatdetailsComponent } from './catdetails/catdetails.component';
import { GetallpdtComponent } from './getallpdt/getallpdt.component';
import { HomeComponent } from './home/home.component';
import { PdtdetailComponent } from './pdtdetail/pdtdetail.component';

const routes: Routes = [
  {path:"",redirectTo: 'Home', pathMatch: 'full' },
  {path:"Products",component:GetallpdtComponent},
  {path:"Details/:id",component:PdtdetailComponent},
  {path:"DetailsOfCategory/:id",component:CatdetailsComponent},
  {path:"Home",component:HomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
