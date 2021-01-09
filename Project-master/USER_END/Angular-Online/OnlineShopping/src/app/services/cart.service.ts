import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Cart } from "../models/cart.model";

@Injectable()
export class CartService
{
    constructor(private getHttp:HttpClient,private addHttp:HttpClient)
    {

    }

    public getCart(id:number)
    {
        return this.getHttp.get("http://localhost:61535/api/Cart/"+id);
    }

    public addToCart(cart:Cart)
    {
        return this.addHttp.post("http://localhost:61535/api/Cart/",cart);
    }
}
