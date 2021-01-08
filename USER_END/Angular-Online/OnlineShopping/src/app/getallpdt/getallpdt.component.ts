import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PdtService } from '../services/pdts.service';


@Component({
  selector: 'app-getallpdt',
  templateUrl: './getallpdt.component.html',
  styleUrls: ['./getallpdt.component.css']
})
export class GetallpdtComponent implements OnInit {
products:any;
min="";
max="";
SortbyParam=" ";
SortOrder=" ";
msg:any;
Min="";
Max="";

  constructor(private PdtService:PdtService,private route:Router)
   {
    //  this.PdtService.getAllPdts().subscribe(data=>{
    //    this.products=data;
    //  })
   }
 showDetails(id:number)
{
this.route.navigate(["Details",id]);
}

FilterByPrice()
{
  console.log(this.Min);
  console.log(this.Max);
  this.min=this.Min;
  this.max=this.Max;
  console.log(this.min);
  console.log(this.max);
}
onclear()
{
this.SortbyParam=" ";
this.SortOrder=" ";
}

  ngOnInit(): void {
    this.PdtService.getAllPdts().subscribe(data=>{
      this.products=data;
    })
  }
  FilterByPriceClear()
  {
    this.Min='';
    this.Max=''
    this.min='';
    this.max='';
  }
}
