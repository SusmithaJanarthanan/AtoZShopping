import { Component, OnInit ,OnDestroy} from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import {PdtService} from '../services/pdts.service';

@Component({
  selector: 'app-catdetails',
  templateUrl: './catdetails.component.html',
  styleUrls: ['./catdetails.component.scss']
})
export class CatdetailsComponent implements OnInit {

  id?: any;
  category:any;
  private sub:any;
  constructor(private myRoute:ActivatedRoute,private ProductService:PdtService,private route:Router) { }

  ngOnInit() {

    this.sub=this.myRoute.params.subscribe(params=>{
      this.id=+params['id'];
      console.log("Id given is "+this.id);
      this.ProductService.getPdtOfOneCategory(this.id).
    subscribe((data: any)=>this.category=data)
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
