import { Component } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
  //1 - Tendo como dados de entrada a altura e o sexo de uma pessoa,
  //construa o algoritmo para calcular seu peso ideal, utilizando as seguintes fórmulas:
  // para homens: 72,7 * altura - 58;
  // para mulheres: 62,1 * altura - 44,7

export class HomePage {
  fem: string; masc: string; resConv: string;
  opcao: any;
  res: number; altura: string;

  constructor() {}

  calculaPeso(){
    if(this.opcao == 'fem'){
      this.res= ((62.1 * parseFloat(this.altura)) - 44.7);
      this.resConv = this.res.toFixed(2) + 'kg';
    }
    else if(this.opcao == 'masc'){
      this.res= (72.7 * parseFloat(this.altura)) - 58;
      this.resConv = this.res.toFixed(2) + 'kg';
    }
    else{
      this.resConv='Inválido';
    }
    return;
  }
}
