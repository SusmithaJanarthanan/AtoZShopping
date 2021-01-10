import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PdtService } from '../services/pdts.service';

@Component({
  selector: 'app-pdtdetail',
  templateUrl: './pdtdetail.component.html',
  styleUrls: ['./pdtdetail.component.css']
})
export class PdtdetailComponent implements OnInit {

  id:number;
  product:any;
    constructor(private myRoute:ActivatedRoute,private ProductService:PdtService)
     {
      this.ngOnInit();
       this.id=this.myRoute.snapshot.params["id"];
       console.log(this.id);
       this.ProductService.getOnePdtFromApi(this.id).
       subscribe(data=>this.product=data)
     }


  ngOnInit(): void {
  }

}
