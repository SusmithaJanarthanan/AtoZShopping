import { Component, OnInit } from '@angular/core';
import { Products } from '../models/product.model';

@Component({
  selector: 'app-compare',
  templateUrl: './compare.component.html',
  styleUrls: ['./compare.component.css']
})
export class CompareComponent implements OnInit {

  compareList:any;
  constructor() {
    
   }

  ngOnInit(): void {
  }

}
