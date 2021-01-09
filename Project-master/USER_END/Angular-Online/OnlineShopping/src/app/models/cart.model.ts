export class Cart
{
    
    Cart_Id:number;
    User_Id:number;
    Prod_Id:number;
    Prod_Quantity:number;
    Prod_Price:number;

    constructor(Cart_Id:number=0,User_Id:number=0,Prod_Id:number=0,Prod_Quantity:number=0,Prod_Price:number=0)
    {
        this.Cart_Id=Cart_Id;
        this.User_Id=User_Id;
        this.Prod_Id=Prod_Id;
        this.Prod_Quantity=Prod_Quantity;
        this.Prod_Price=Prod_Price;
    }

}