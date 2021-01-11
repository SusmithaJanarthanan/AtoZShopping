import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { MyProfileService } from '../services/myprofile.service';

@Component({
  selector: 'app-myprofile',
  templateUrl: './myprofile.component.html',
  styleUrls: ['./myprofile.component.css']
})
export class MyprofileComponent implements OnInit {

  id:any;
  details:any;
  
  constructor(private myRoute:ActivatedRoute,private myProfileService:MyProfileService) {
    this.ngOnInit();
    this.id= this.myRoute.snapshot.params["id"];
    console.log(this.id);
    this.myProfileService.getMyProfile(this.id).subscribe(data=>
     this.details=data);
  }

  ngOnInit(): void {
  }

}
