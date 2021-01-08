import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PdtService } from '../services/pdts.service';
 declare var jQuery: any;

@Component({
  selector: 'app-pdtdetail',
  templateUrl: './pdtdetail.component.html',
  styleUrls: ['./pdtdetail.component.css']
})
export class PdtdetailComponent implements OnInit,OnDestroy {

  id?:number;
  product:any;

  private sub:any;

    constructor(private myRoute:ActivatedRoute,private ProductService:PdtService)
    {
    }


   ngOnInit(): void {
    this.sub=this.myRoute.params.subscribe(params=>{
      this.id=+params['id'];
      console.log("Id given is "+this.id);
      this.ProductService.getOnePdtFromApi(this.id).
      subscribe(data=>this.product=data)
    })

    

  }
  ngOnDestroy() {
    this.sub.unsubscribe();
  }

}
