import {HttpClient} from '@angular/common/http';
import {  Injectable } from '@angular/core';

@Injectable()
export class PdtService
{
  constructor(private getHttp:HttpClient,private getone:HttpClient,private getCat:HttpClient,private getoneCat:HttpClient)
  {

  }
  public getAllPdts()
  {
    return this.getHttp.get("http://localhost:62520/api/products");
  }
  public getOnePdtFromApi(id:number)
{
return this.getone.get("http://localhost:62520/api/products/"+id);
}
public getAllCategory()
{
  return this.getCat.get("http://localhost:62520/api/category");
}
public getPdtOfOneCategory(id:number)
{
  return this.getoneCat.get("http://localhost:62520/api/category/"+id);
}
}

