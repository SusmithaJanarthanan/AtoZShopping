import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormControl, FormGroup,NgModel,Validators } from '@angular/forms';
import {FormsModule,ReactiveFormsModule} from '@angular/forms'
import { Router } from '@angular/router';

@Component({
  selector: 'app-checkoutpage',
  templateUrl: './checkoutpage.component.html',
  styleUrls: ['./checkoutpage.component.scss']
})
export class CheckoutpageComponent implements OnInit {
  myCheckout!: FormGroup;
  fullname:string="";

 
  constructor(private fb:FormBuilder ,private route:Router) {   
  }
  ShowOrders(){
    this.ngOnInit();
    this.route.navigate(["orders"])
  }

  ngOnInit(): void {    
    this.myCheckout=this.fb.group({

        fullname:['',[Validators.required]],
        email:['',[Validators.required]],
        doornumber:['',[Validators.required]],
        street:['',[Validators.required]],
        city:['',[Validators.required]],
        state:['',[Validators.required]],
        zipcode:['',[Validators.required]],        
        cardholdername:['',[Validators.required]],
        cardnumber:['',[Validators.required]],
        expirydate:['',[Validators.required]],
        cvv:['',[Validators.required]]

      });
  }
}
