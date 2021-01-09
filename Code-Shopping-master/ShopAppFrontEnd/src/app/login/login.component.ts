import { Component, OnInit } from '@angular/core';
import { Retailer } from '../models/Retailer.model';
import { CookieService } from 'ngx-cookie-service'; 
 import { Router, ActivatedRoute } from '@angular/router';  
import { RetailerService } from '../services/Retailer.service';
import { authService } from '../services/auth.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
retailer:Retailer;
user:any;
msg:any;
Username="";
Password="";

  constructor(private authservice:authService,private loginservice:RetailerService, private router: Router, 
    public activatedRoute: ActivatedRoute, private cookieService: CookieService) { 
    this.retailer=new Retailer();
  }

  ngOnInit(): void {
  }

  onSubmit() {  
    
      this.loginservice.loginRetailer(this.retailer).subscribe(
        data => {
          this.user = data; // able to print the data
          JSON.stringify(this.user);
          this.processResults()},
          err=>this.msg = err.error.Message);  
          
    }

  processResults() {
      console.log(this.user);
      this.authservice.retailerid=this.user.Retail_Id;
      console.log(this.authservice.retailerid);
      console.log(this.user.Retail_Id);
      this.cookieService.set('username', this.user.Retail_Name);
      this.cookieService.set('password', this.user.Retail_Password);
      this.authservice.isLogged=true;
      this.router.navigate(['/FrontPage']);

  }
  Sign_Up()
  {
    this.router.navigate(['/addRetailer']);

  }

}
  
      
           
      
      
      
      //   u=>{this.user = u; this.msg=undefined; const obj=this.user},
    
      // err=>this.msg = err.error.Message);  
     
     
      
    
      
   
    
    
    
  


