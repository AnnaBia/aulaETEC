import { Component } from '@angular/core';
import { ToastController } from '@ionic/angular';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
  // 2 - Elabore um algoritmo que, dada a idade de um nadador, classifique-o em uma das seguintes categorias:
  // Infantil A: 5 a 7 anos;
  // Infantil B: 8 a 10 anos;
  // Juvenil A: 11 a 13 anos;
  // Juvenil B: 14 a 17 anos;
  // Senior: maiores de 18 anos.

export class HomePage {
  idade: number;
  res: string;

 constructor() {}

  classifica(){
    if(this.idade == null){
      this.res='  ';
    }
    else if(this.idade <= 0){
      this.res='Idade inválida';
    }
    else if(this.idade > 0 && this.idade < 5){
      this.res='Idade não permitida!';
    }
    else if(this.idade >= 5 && this.idade <=7){
      this.res='Categoria Infantil A: 5 a 7 anos';
    }
    else if(this.idade >= 8 && this.idade <=10){
      this.res='Categoria Infantil B: 8 a 10 anos';
    }
    else if(this.idade >= 11 && this.idade <=13){
      this.res='Categoria Juvenil A: 11 a 13 anos';
    }
    else if(this.idade >= 14 && this.idade <=17){
      this.res='Categoria Juvenil B: 14 a 17 anos';
    }
    else if(this.idade >= 18){
      this.res='Categoria Sênior: maiores de 18 anos';
    }
    else{
      this.res='Informação inválida, digite novamente!';
    }
  }

}
