import {Observable} from "rxjs";
import {Injectable} from "@angular/core";
import {HttpService} from "../shared/http.service";

@Injectable({
  providedIn: 'root'
})
export class MessageService {

  constructor(private httpService: HttpService) {
  }

  getMessage(): Observable<Message> {
    return this.httpService.get<Message>('/message');
  }

}
