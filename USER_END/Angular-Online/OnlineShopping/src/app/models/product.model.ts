export class Products
{
  Prod_Id:number;
  name:string;
  price:number;
  image:any;
  description:string;
  quantity:number;

  constructor(Prod_Id:number=0,name:string="",price:number=0,image:any,description:string="",quantity:number=0)
  {
    this.Prod_Id=Prod_Id;
    this.name=name;
    this.price=price;
    this.image=image;
    this.description=description;
    this.quantity=quantity;
  }
}
