import {MessageService} from "./message.service";
import {cold} from "jasmine-marbles";
import {HttpService} from "../shared/http.service";

describe('MessageService', () => {
  let httpServiceSpy: jasmine.SpyObj<HttpService>;
  let messageService: MessageService;

  beforeEach(() => {
    httpServiceSpy = jasmine.createSpyObj('HttpService', ['get'])
    messageService = new MessageService(httpServiceSpy);
  });

  it('getMessage should call get /message', () => {
    messageService.getMessage();

    expect(httpServiceSpy.get).toHaveBeenCalledWith('/message');
  });

  it(`getMessage should return Observable<Message>`, () => {
    httpServiceSpy.get.and.returnValue(cold('-m-', {m: 'Hello World'}))

    expect(messageService.getMessage()).toBeObservable(cold('-m-', {m: 'Hello World'}));
  });

});
