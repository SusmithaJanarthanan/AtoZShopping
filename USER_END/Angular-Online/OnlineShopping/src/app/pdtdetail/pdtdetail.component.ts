import { Component, OnDestroy, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PdtService } from '../services/pdts.service';
 declare var $:any;

@Component({
  selector: 'app-pdtdetail',
  templateUrl: './pdtdetail.component.html',
  styleUrls: ['./pdtdetail.component.css']
})
export class PdtdetailComponent implements OnInit,OnDestroy {

  num!:number;
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

  ngAfterViewInit(): void {
    // Called after ngAfterContentInit when the component's view has been initialized. Applies to components only.
    // Add 'implements AfterViewInit' to the class.
    // $(document).ready(function(){
    //   $('.small-image img').click(function(){
    //   var image=$(<any>this.$).attr('src');
    //   $('.big-image img').attr('src',image);
    //   });
    //   $('#zoom').imagezoomsl()
    //     });
    $(document).ready(function(){
      $('#zoom').imagezoomsl();
         });

  }
 change(num:any){
    // var temp1= document.getElementsByClassName("big-image");
    // var temp2= document.getElementsByClassName(num);
    // temp1[0].setAttribute("src",temp2[0].getAttribute("src"));

}


}
