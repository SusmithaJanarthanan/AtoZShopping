import { Component, OnInit } from '@angular/core';
import { ComparepdtService } from '../services/comparepdt.service';

@Component({
  selector: 'app-compare',
  templateUrl: './compare.component.html',
  styleUrls: ['./compare.component.css']
})
export class CompareComponent implements OnInit {
  list1:any[]=[];
  constructor(private compare:ComparepdtService)
   {
    this.list1=this.compare.list;
    }

remov(id:number)
{
  // this.list1.forEach(element => {


  //   if(element.Prod_Id===id)
  //   {
  //     this.list1.findIndex(element)
  //   }

  // });

  let index = this.list1.findIndex(d => d.Prod_Id === id);
  if(index)
  {
    this.list1.splice(index, 1);
  }
  
}




  ngOnInit(): void {
  }

}
