import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import {MessageComponent} from "./message/message.component";
import {HttpClientModule} from "@angular/common/http";
import {REST_API_URL_TOKEN} from "./app.di.token";
import {environment} from "../environments/environment";

@NgModule({
  declarations: [
    AppComponent,
    MessageComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule
  ],
  providers: [
    {provide: REST_API_URL_TOKEN, useValue: environment.apiUrl}
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
