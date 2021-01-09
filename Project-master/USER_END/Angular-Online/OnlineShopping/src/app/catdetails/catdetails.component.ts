import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute, ParamMap, Router } from '@angular/router';
import { PdtService } from '../services/pdts.service';

@Component({
  selector: 'app-catdetails',
  templateUrl: './catdetails.component.html',
  styleUrls: ['./catdetails.component.css']
})
export class CatdetailsComponent implements OnInit,OnDestroy
 {

  id?: any;
  category:any;
  private sub:any;

  constructor(private myRoute:ActivatedRoute,private ProductService:PdtService,private route:Router)
  {
    // this.id=this.myRoute.snapshot.params["id"];
    // console.log("Id given is "+this.id);
    // this.ProductService.getPdtOfOneCategory(this.id).
    // subscribe(data=>this.category=data)
  }
  ngOnInit() {

    this.sub=this.myRoute.params.subscribe(params=>{
      this.id=+params['id'];
      console.log("Id given is "+this.id);
      this.ProductService.getPdtOfOneCategory(this.id).
    subscribe(data=>this.category=data)
    })


  }
  ngOnDestroy() {
    this.sub.unsubscribe();
  }
  showDetails(id:number)
  {
  console.log("Product chosen"+id);
  this.route.navigate(["Details",id])
  }
}
