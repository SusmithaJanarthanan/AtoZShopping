import { Component, OnInit } from '@angular/core';
import { Dummy } from '../models/dummy.model';
import { Retailer } from '../models/Retailer.model';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.css']
})
export class ChangePasswordComponent implements OnInit {
retailer:Retailer;
dummy:Dummy;
  constructor() {
    this.retailer=new Retailer();
    this.dummy=new Dummy();
   }
   Add()
   {
     
   }

  ngOnInit(): void {
  }

}
