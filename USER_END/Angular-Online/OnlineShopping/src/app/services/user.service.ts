
import {HttpClient} from '@angular/common/http';
import { Injectable } from '@angular/core';
import{Users} from '../models/user.model'

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private getHttp:HttpClient)
  {

  }
  public getAllUsers()
  {
      return this.getHttp.get("http://localhost:62441/api/User/all");
  }
  public loginUser(user:Users)
  {
      return this.getHttp.post("http://localhost:62441/api/Login",user);
  }
  public getUserPersonal(id:number)
  {
      return this.getHttp.get("http://localhost:62441/api/User/details/"+id);
  }
}
