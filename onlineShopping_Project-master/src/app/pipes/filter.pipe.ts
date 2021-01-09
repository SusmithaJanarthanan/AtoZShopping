import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'filter'
})
export class FilterPipe implements PipeTransform {

  transform(value: Array<any>,searchTerm: any): any {
    
    if(value.length===0)
    {
      return value;
    }
    return value.filter(i => i.Prod_Name.toLowerCase().includes(searchTerm))
    
  }

}
