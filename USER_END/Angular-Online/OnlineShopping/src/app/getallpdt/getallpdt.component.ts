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
  constructor(private PdtService:PdtService,private route:Router)
   {
     this.PdtService.getAllPdts().subscribe(data=>{
       this.products=data;
     })
   }
showDetails(id:number)
{
  this.ngOnInit();
this.route.navigate(["Details",id])

}

  ngOnInit(): void {
  }

}
